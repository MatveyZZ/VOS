#include <conio.h> // getch()
#include <stdio.h> // printf()
#include <Windows.h>
#include <stdlib.h>

int main(void) 
{
    int x, y; // map coords
    int xx = 5, yy = 5; // player coords
    int tx = 11, ty = 7; // goblin coords
    char map[21][11];
    char action = 0; // WASD controller
    int gold_total = 0;
    int gold;
    char defeat_flag = 0;

    do
    {
        system("cls");
        printf("Click 'q' + Enter to exit the game\n\n");
        // controls and check for walls
        if      (action == 'w' && map[xx][yy - 1] != '#') yy--;
        else if (action == 's' && map[xx][yy + 1] != '#') yy++;
        else if (action == 'a' && map[xx - 1][yy] != '#') xx--;
        else if (action == 'd' && map[xx + 1][yy] != '#') xx++;

        // goblin fight
        if (xx == tx && yy == ty) {
            tx = (rand() % 18) + 1;
            ty = (rand() % 8) + 1;
            gold = rand() % 10 + 1;
            defeat_flag = 1;
        }

        for (y = 0; y <= 10; y++) 
        {
            for (x = 0; x <= 20; x++) 
            {
                if (x == xx && y == yy) 
                {
                    printf("@");
                }
                else if (x == tx && y == ty) 
                {
                    printf("t");
                }
                else if (y == 0 || y == 10)
                {
                    printf("#");
                    map[x][y] = '#';
                    if (x == 20) 
                    {
                        printf("\n");
                    }
                }
                else if (x == 0) 
                {
                    printf("#");
                }
                else if (x == 20) 
                {
                    printf("#\n");
                    map[x][y] = '#';
                }
                else 
                {
                    printf(" ");
                    map[x][y] = ' ';
                }
            }
        }

        if (defeat_flag)
        {
            printf("You've defeated a goblin and got %d gold!\n\n", gold);
            printf("Gold: %d\n", gold_total += gold);
            defeat_flag = 0;
            gold = 0;
        }
        else
        {
            printf("\n\nGold: %d\n", gold_total);
        }
        
        // Get user input
        action = getch();

        // Check for exit condition
        if (action == 'q') {
            break; // Exit the loop if 'q' is pressed
        }

    } 
    while (1); // Infinite loop, will break on 'q'
    

    getchar();
    getchar();
    return 0;
}