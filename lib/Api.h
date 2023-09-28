#ifndef API_H
#define API_H

#define WINDOW_WIDTH    1000
#define WINDOW_HEIGHT   1000
#define BITS_PER_PIXEL  32


// Byte for each component
typedef struct colorRGBA8 {
    char r, g, b, a;
} colorRGBA8;


// Too slow vvv
void setPixel(const int x, const int y, const colorRGBA8 color);
void setPixels(const int x, const int y, const int width, const int height, const colorRGBA8* colors);
void flush();


#endif // API_H
