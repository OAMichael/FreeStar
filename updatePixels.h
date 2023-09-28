#include "lib/Api.h"

#define CELL_DEAD_STATUS    0
#define CELL_ALIVE_STATUS   1
#define CELL_MAX_GENERATION 10

#define CELL_PIXEL_SIZE     8
#define CELL_WIDTH_COUNT    (WINDOW_WIDTH / CELL_PIXEL_SIZE)
#define CELL_HEIGHT_COUNT   (WINDOW_HEIGHT / CELL_PIXEL_SIZE)

#define BIG_DELAY_NUMBER    20000000ULL

#define NEED_RENDER(x)      (((x) % BIG_DELAY_NUMBER) == 0)


typedef struct Cell {
    unsigned int lifeStatus;
    unsigned int generation;
} Cell;


static Cell g_Cells[CELL_HEIGHT_COUNT * CELL_WIDTH_COUNT] = {};
static colorRGBA8 g_Pixels[WINDOW_WIDTH * WINDOW_HEIGHT] = {};


// Linear congruent pseudo random generator
static int getRandomInt() {
    // Literally just slapped the keyboard
    const static int a = 15315;
    const static int b = 486463;
    const static int m = 7946431;

    static int currX = 0;

    currX = (a * currX + b) % m;
    return currX;
}


static int getRandomBool() {
    return getRandomInt() % 2;
}


static void paintCellPixels(const int cellX, const int cellY, const colorRGBA8 color) {
    // +1 and -1 made for cell border
    for (int winY = cellY * CELL_PIXEL_SIZE + 1; winY < cellY * CELL_PIXEL_SIZE + CELL_PIXEL_SIZE - 1; ++winY) {
        for (int winX = cellX * CELL_PIXEL_SIZE + 1; winX < cellX * CELL_PIXEL_SIZE + CELL_PIXEL_SIZE - 1; ++winX) {
            g_Pixels[winX + WINDOW_WIDTH * winY].r = color.r;
            g_Pixels[winX + WINDOW_WIDTH * winY].g = color.g;
            g_Pixels[winX + WINDOW_WIDTH * winY].b = color.b;
            g_Pixels[winX + WINDOW_WIDTH * winY].a = color.a;
        }
    }
}


static void initCells() {
    for (int j = 0; j < CELL_HEIGHT_COUNT; ++j) {
        for (int i = 0; i < CELL_WIDTH_COUNT; ++i) {
            int val = getRandomBool();

            if (val) {
                g_Cells[i + j * CELL_WIDTH_COUNT].lifeStatus = val;
                g_Cells[i + j * CELL_WIDTH_COUNT].generation = val;

                colorRGBA8 cellColor = {};
                cellColor.r = 0;
                cellColor.g = val * 255;
                cellColor.b = 0; 
                cellColor.a = 255;

                paintCellPixels(i, j, cellColor);
            }
        }
    }
    setPixels(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, g_Pixels);
}


static void updatePixels() {
    // Used for updating cells' data after main loop. Yes, it is slow but no alternative
    static Cell swapCells[CELL_HEIGHT_COUNT * CELL_WIDTH_COUNT] = {};

    // Loop over all cells
    for (int j = 0; j < CELL_HEIGHT_COUNT; ++j) {
        for (int i = 0; i < CELL_WIDTH_COUNT; ++i) {
            const int currentCellIdx = i + j * CELL_WIDTH_COUNT;

            const int idxLeft   = (i - 1 + CELL_WIDTH_COUNT) % CELL_WIDTH_COUNT;
            const int idxMidX   = (i + 0) % CELL_WIDTH_COUNT;
            const int idxRight  = (i + 1) % CELL_WIDTH_COUNT;

            const int idxBottom = (j - 1 + CELL_HEIGHT_COUNT) % CELL_HEIGHT_COUNT;
            const int idxMidY   = (j + 0) % CELL_HEIGHT_COUNT;
            const int idxUp     = (j + 1) % CELL_HEIGHT_COUNT;


            const int neighbStates[8] = {
                g_Cells[idxLeft  + idxBottom * CELL_WIDTH_COUNT].lifeStatus,
                g_Cells[idxLeft  + idxMidY   * CELL_WIDTH_COUNT].lifeStatus,
                g_Cells[idxLeft  + idxUp     * CELL_WIDTH_COUNT].lifeStatus,

                g_Cells[idxMidX  + idxBottom * CELL_WIDTH_COUNT].lifeStatus,
                g_Cells[idxMidX  + idxUp     * CELL_WIDTH_COUNT].lifeStatus,

                g_Cells[idxRight + idxBottom * CELL_WIDTH_COUNT].lifeStatus,
                g_Cells[idxRight + idxMidY   * CELL_WIDTH_COUNT].lifeStatus,
                g_Cells[idxRight + idxUp     * CELL_WIDTH_COUNT].lifeStatus
            };

            int numNeighbourAlive = 0;
            for(int k = 0; k < 8; ++k)
                if(neighbStates[k] == CELL_ALIVE_STATUS)
                    ++numNeighbourAlive;


            // Birth if 2 / Survival if 0 or 3 or 4 or 5
            // Handle 4 technical cases by nested if's
            if (g_Cells[currentCellIdx].lifeStatus == CELL_ALIVE_STATUS) {
                if (numNeighbourAlive == 0
                    || numNeighbourAlive == 3
                    || numNeighbourAlive == 4
                    || numNeighbourAlive == 5
                    )
                {
                    
                    swapCells[currentCellIdx].lifeStatus = CELL_ALIVE_STATUS;
                    swapCells[currentCellIdx].generation = g_Cells[currentCellIdx].generation + 1;
                }
                else {
                    swapCells[currentCellIdx].lifeStatus = CELL_DEAD_STATUS;
                    swapCells[currentCellIdx].generation = 0;
                }
            }
            else {
                if (numNeighbourAlive == 2) {
                    swapCells[currentCellIdx].lifeStatus = CELL_ALIVE_STATUS;
                    swapCells[currentCellIdx].generation = 1;
                }
                else {
                    swapCells[currentCellIdx].lifeStatus = CELL_DEAD_STATUS;
                    swapCells[currentCellIdx].generation = 0;
                }
            }
        }
    }

    // Usage of swap cells
    for (int j = 0; j < CELL_HEIGHT_COUNT; ++j) {
        for (int i = 0; i < CELL_WIDTH_COUNT; ++i) {
            const int currentCellIdx = i + j * CELL_WIDTH_COUNT;

            g_Cells[currentCellIdx].lifeStatus = swapCells[currentCellIdx].lifeStatus;
            g_Cells[currentCellIdx].generation = swapCells[currentCellIdx].generation;


            colorRGBA8 cellColor = {};
            if (g_Cells[currentCellIdx].generation == CELL_MAX_GENERATION) {
                g_Cells[currentCellIdx].lifeStatus = CELL_DEAD_STATUS;
                g_Cells[currentCellIdx].generation = 0;
            }

            if (g_Cells[currentCellIdx].lifeStatus == CELL_ALIVE_STATUS) {
                int currGeneration = g_Cells[currentCellIdx].generation;

                cellColor.r = 0;
                cellColor.g = 0;
                cellColor.b = 0;
                cellColor.a = 255;

                if (currGeneration > CELL_MAX_GENERATION - 4)
                    cellColor.r = 127 - 2 * (CELL_MAX_GENERATION - currGeneration);

                if (currGeneration < CELL_MAX_GENERATION / 2)
                    cellColor.g = 255 / g_Cells[currentCellIdx].generation;
    
                if (currGeneration >= CELL_MAX_GENERATION / 2 && currGeneration <= CELL_MAX_GENERATION - 4)
                    cellColor.b = 127;
            }

            paintCellPixels(i, j, cellColor);
        }
    }

    setPixels(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, g_Pixels);
}
