make truth tables with coffeescript.

i had a homework assignment that made us generate truth tables, and there's no way i was doing all that by hand when i had a Computer Machine! so i made this. maybe it'll be useful to you!

*test.coffee* should do a good job explaining how this works. here's the output of that:

    ┌───┬───┬─────────┬────────────┬────────────────────────┐
    │ P │ Q │ (!P)||Q │ !((!Q)||P) │ ((!P)||Q)===!((!Q)||P) │
    ├───┼───┼─────────┼────────────┼────────────────────────┤
    │ F │ F │ T       │ F          │ F                      │
    ├───┼───┼─────────┼────────────┼────────────────────────┤
    │ F │ T │ T       │ T          │ T                      │
    ├───┼───┼─────────┼────────────┼────────────────────────┤
    │ T │ F │ F       │ F          │ T                      │
    ├───┼───┼─────────┼────────────┼────────────────────────┤
    │ T │ T │ T       │ F          │ F                      │
    └───┴───┴─────────┴────────────┴────────────────────────┘
