#include <gb/gb.h>
#include <stdio.h>
#include "sprites.c"

void main()
{
    UINT8 currentspriteindex = 0;
    set_sprite_data(0, 2, Character);
    set_sprite_tile(0, 0);
    move_sprite(0, 88, 78);

    SHOW_SPRITES; //display sprites

    while (1)
    {
        if (currentspriteindex == 0)
        {
            currentspriteindex = 1;
        }
        else
        {
            currentspriteindex = 0;
        }
        set_sprite_tile(0, currentspriteindex);
        delay(1000);
        scroll_sprite(0, 10, 0);
    }
}