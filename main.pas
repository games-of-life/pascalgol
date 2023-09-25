program PascalGol;

uses Raylib, Grid;

const
   W             = 800;
   H             = 600;
   BOX_DIMENSION = 10;
   BOX_WIDTH     = W div BOX_DIMENSION;
   BOX_HEIGHT    = H div BOX_DIMENSION;
var
   i, j     : integer;
   gr       : TGrid;
   curColor : TColorB;
begin
   gr.Init(BOX_WIDTH, BOX_HEIGHT);

   InitWindow(W, H, 'Game of life');
   { SetTargetFPS(60); }

   while not WindowShouldClose do
   begin
      BeginDrawing;
      ClearBackground(BLACK);
      for i := 0 to BOX_WIDTH - 1 do
      begin
         for j := 0 to BOX_HEIGHT - 1 do
         begin
            if gr.GetElem(i, j) = alive then
               curColor := WHITE
            else
               curColor := BLACK;
            DrawRectangle(BOX_DIMENSION * i, BOX_DIMENSION * j,
                          BOX_DIMENSION - 1, BOX_DIMENSION - 1,
                          curColor);
         end;
      end;
      DrawFPS(10, 20);
      EndDrawing;
   end;
   CloseWindow;
end.
