Program WarmUp2;
{
 There are red and green bacteria. Red turn green in one tact of time.
 Green in one tact of time are divided into two: red and green.
 Find the amount of red and green bacteria, and the total amount.
}

{$APPTYPE CONSOLE}

Var
  Red, Green, Total, Tacts, i : integer;
  GoldenRat1, GoldenRat2, TotalRed, TotalGreen, F_tacts1, F_tacts2: Real;
  //Red - amount of red bacteria
  //Green - amount of green bacteria
  //Total - total number of bacteria
  //Tacts - total amount of tacts
  //i - cycle counter (for the exponentiation)
  //GoldenRat1 - golden ratio
  //GoldenRat2 - the negative golden ratio
  //F_tacts1  - exponentiation golden ratio
  //F_tacts2  - exponentiation of the negative golden ratio
  //TotalRed - amount of red after all tacts of time
  //TotalGreen - amount of green after all tacts of time


Begin
  Writeln('Input condition! Either entered number must be >=0.');
  Writeln('Because there cannot be a negative amount of bacteria or tacts of time.');
  Writeln('Also the numbers must be integers.');
  Writeln;
  Writeln('There are red and green bacteria.');
  Writeln('Red turn green in one tact of time. Green in one tact of time are divided into two: red and green.');
  Writeln('Enter the amount of red bacteria');
  Readln(Red);
  Writeln('Enter the amount of green bacteria');
  Readln(Green);
  Writeln('Enter the amount of tacts of time');
  Readln(Tacts);

  if (Red<0) or (Green<0) or (Tacts<0) then
    Writeln('Input condition violated! Restart the program.')

  else
  begin

    //Consider the golden ratio and the negative golden ratio
    GoldenRat1:= (1+sqrt(5))/2;
    GoldenRat2:= (1-sqrt(5))/2;

    //Raise the golden ratio and the negative golden ratio to the power of Tacts.
    F_tacts1:= 1;
    F_tacts2:= 1;
    for i := 1 to Tacts do
    begin
      F_tacts1:= F_tacts1*GoldenRat1;
      F_tacts2:= F_tacts2*GoldenRat2;
    end;

    //Count the amount according to Binet's formula
    TotalRed:= ((F_tacts1/GoldenRat1) - (F_tacts2/GoldenRat2)) / exp(1/2*ln(5)) * Red + (F_tacts1 - F_tacts2) / exp(1/2*ln(5)) * Green;
    TotalGreen:= (F_tacts1 - F_tacts2) / exp(1/2*ln(5)) * Red + ((F_tacts1*GoldenRat1) - (F_tacts2*GoldenRat2)) / exp(1/2*ln(5)) * Green;

    Total:= Round(TotalRed) + Round(TotalGreen);
    Writeln('After ', Tacts, ' tacts of time, red became ', Round(TotalRed), ', green became ', Round(TotalGreen), '. The total number of bacteria: ', Total);
  end;

  Readln;
End.
