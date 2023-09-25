unit Grid;

interface

type
   TCellState =  (dead, alive);

   TGrid = Object
       x, y : integer;
       field : array of array of TCellState;

       function GetElem(_x, _y : integer) : TCellState;

       constructor Init(_x, _y : integer);
       destructor CleanUp();
   end;

implementation

function TGrid.GetElem(_x, _y : integer ) : TCellState;
begin
   GetElem := field[_x][_y];
end;

constructor TGrid.Init(_x, _y : integer);
var
   i, j : integer;
begin
   x := _x;
   y := _y;
   SetLength(field, x, y);
   for i := 0 to x - 1 do
   begin
      for j := 0 to y - 1 do
      begin
         field[i][j] := dead;
      end;
   end;
end;

destructor TGrid.CleanUp();
begin
   SetLength(field, 0, 0);
end;

end.
