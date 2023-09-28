#ifndef FREE_STAR_H
#define FREE_STAR_H


#include <stdbool.h>

#include <SFML/Graphics.h>

#include <Api.h>


typedef struct appContext {
    sfRenderWindow* window;
    sfTexture* texture;
    sfSprite* sprite;
    sfEvent event;

    bool initialized;

} appContext;


static appContext g_Context = {
    NULL, NULL, NULL, 0, false
};

appContext* getContext() {
    return &g_Context;
}


void initGraphics();
void destroyGraphics();


#endif // FREE_STAR_H
