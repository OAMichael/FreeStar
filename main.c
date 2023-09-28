#include "updatePixels.h"


int main() {

    initCells();
    flush();

    // Hack to force screen updating less frequently
    unsigned long long delay = 1;

    while (1) {
        if (NEED_RENDER(delay)) {
            updatePixels();
            flush();
        }
        ++delay;
    }

    return 0;
}
