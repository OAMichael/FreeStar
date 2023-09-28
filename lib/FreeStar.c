#include <stdlib.h>

#include <FreeStar.h>

// ====================================================== GRAPHICS RESOURCES ======================================================

void initGraphics() {
    appContext* ctx = getContext();

    sfVideoMode mode = {
        WINDOW_WIDTH,
        WINDOW_HEIGHT,
        BITS_PER_PIXEL
    };
    
    ctx->window = sfRenderWindow_create(mode, "Free Star", sfClose, NULL);
    if (!ctx->window)
        exit(EXIT_FAILURE);
 
    ctx->texture = sfTexture_create(WINDOW_WIDTH, WINDOW_HEIGHT);
    if (!ctx->texture)
        exit(EXIT_FAILURE);    

    ctx->sprite = sfSprite_create();
    if (!ctx->sprite)
        exit(EXIT_FAILURE);


    sfSprite_setTexture(ctx->sprite, ctx->texture, true);

    ctx->initialized = true;
}


void destroyGraphics() {
    appContext* ctx = getContext();
    sfSprite_destroy(ctx->sprite);
    sfTexture_destroy(ctx->texture);
    sfRenderWindow_destroy(ctx->window);
    exit(EXIT_SUCCESS);
}


// ================================================================================================================================

// ============================================================== API =============================================================

// Too slow for multiple pixels
void setPixel(const int x, const int y, const colorRGBA8 color) {
    appContext* ctx = getContext();

    if (!ctx->initialized) {
        initGraphics();
    }
    
    if (ctx->texture) {
        sfTexture_updateFromPixels(ctx->texture, (char*)(&color), 1, 1, x, y);
    }
}


void setPixels(const int x, const int y, const int width, const int height, const colorRGBA8* colors) {
    appContext* ctx = getContext();

    if (!ctx->initialized) {
        initGraphics();
    }

    if (ctx->texture) {
        sfTexture_updateFromPixels(ctx->texture, (char*)colors, width, height, x, y);
    }
}


void flush() {
    appContext* ctx = getContext();

    if (!ctx->initialized) {
        initGraphics();
    }

    while (sfRenderWindow_pollEvent(ctx->window, &ctx->event)) {
        if (ctx->event.type == sfEvtClosed) {
            sfRenderWindow_close(ctx->window);
            destroyGraphics();
            return;
        }
    }

    sfRenderWindow_clear(ctx->window, sfBlack);      
    sfRenderWindow_drawSprite(ctx->window, ctx->sprite, NULL);
    sfRenderWindow_display(ctx->window);
}
