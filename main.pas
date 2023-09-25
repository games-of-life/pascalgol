program PascalGol;

uses Raylib, Grid;

const
   WIDTH         = 800;
   HEIGHT        = 600;
   BOX_DIMENSION = 10;
   BOX_WIDTH     = WIDTH div BOX_DIMENSION;
   BOX_HEIGHT    = HEIGHT div BOX_DIMENSION;
var
   i, j     : integer;
   gr       : TGrid;
   curColor : TColorB;
begin
   gr.initRandom(BOX_WIDTH, BOX_HEIGHT, 0.5);

   InitWindow(WIDTH, HEIGHT, 'Game of life');
   { SetTargetFPS(60); }

   while not WindowShouldClose do
   begin
      BeginDrawing;
      ClearBackground(BLACK);

      for i := 0 to BOX_WIDTH - 1 do
      begin
         for j := 0 to BOX_HEIGHT - 1 do
         begin

            if gr.getElem(i, j) = alive then
               curColor := WHITE
            else
               curColor := BLACK;

            DrawRectangle(BOX_DIMENSION * i, BOX_DIMENSION * j,
                          BOX_DIMENSION - 1, BOX_DIMENSION - 1,
                          curColor);
         end;
      end;

      DrawFPS(10, 10);
      gr.runGOLStep;
      EndDrawing;
   end;

   gr.deInit;
   CloseWindow;
end.
