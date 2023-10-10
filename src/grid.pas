unit Grid;

interface

type
   TCellState = (dead, alive);

   TGrid = object
       private
           width, height : integer;
           field : array of array of TCellState;
           function CalculateNeighbors(i, j : integer) : integer;

       public
           constructor InitRandom(_width, _height : integer; prob : real);

           function GetElem(i, j : integer) : TCellState;
           procedure SetElem(i, j : integer; val : TCellState);
           procedure RunGOLStep();

           destructor DeInit();
   end;

implementation

constructor TGrid.InitRandom(_width, _height : integer; prob : real);
var
   i, j        : integer;
   ChosenState : TCellState;
begin
   randomize;
   width := _width;
   height := _height;
   SetLength(field, width, height);
   for i := 0 to width - 1 do
      for j := 0 to height - 1 do
      begin

         if random < prob then
            ChosenState := alive
         else
            ChosenState := dead;

         field[i, j] := ChosenState;
      end;
end;

function TGrid.GetElem(i, j : integer) : TCellState;
begin
   GetElem := field[i, j];
end;

procedure TGrid.SetElem(i, j : integer; val : TCellState);
begin
   field[i, j] := val;
end;

function TGrid.CalculateNeighbors(i, j : integer) : integer;
var
   i_cor, j_cor : integer;
begin
   CalculateNeighbors := 0;
   for i_cor := i - 1 to i + 1 do
      for j_cor := j - 1 to j + 1 do
         if (not (((i_cor = i) and (j_cor = j))
                 or (i_cor < 0) or (j_cor < 0)
                 or (i_cor >= width) or (j_cor >= height)))
            and (alive = GetElem(i_cor, j_cor)) then
              inc(CalculateNeighbors);
end;

procedure TGrid.RunGOLStep();
var
   newField    : array of array of TCellState;
   i, j, neigh : integer;
begin
   SetLength(newField, width, height);

   for i := 0 to width - 1 do
      for j := 0 to height - 1 do
      begin
         neigh := CalculateNeighbors(i, j);
         if (3 = neigh) or ((2 = neigh) and (alive = GetElem(i, j))) then
            newField[i, j] := alive
         else
            newField[i, j] := dead;
      end;

   SetLength(field, 0, 0);
   field := newField;
end;


destructor TGrid.deInit();
begin
   SetLength(field, 0, 0);
end;

end.
