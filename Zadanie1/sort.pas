program sort;

const N = 50;

procedure swap(var a, b: integer);
var
	temp: integer;
begin
	temp := a;
	a := b;
	b := temp;
end;

procedure sort_bubble(var arr: array of integer);
var
	i: integer;
	j: integer;
begin
	for i := 0 to N - 1 do
	begin
		for j := 0 to N - 1 do
		begin
			if arr[j] > arr[j + 1] then
			begin
				swap(arr[j], arr[j + 1]);
			end;
		end;
	end;
end;

procedure print_array(var arr: array of integer);
var 
	i: integer;
begin
	for i := 1 to N do
	begin
		write(arr[i] : 5);
	end;

	writeln;
end;

var
	arr: array[1..N] of integer;
	i: integer;
begin
	randomize;
	for i := 1 to N do 
	begin
		arr[i] := random(100);
	end;

	print_array(arr);

	sort_bubble(arr);

	print_array(arr);

end.
