# WarmUp №2. Bacteria
---
### Task:
![The task](https://i.imgur.com/P3pSQaM.png)

>The program calculates the amount of red and green bacteria after all clock ticks and their total amount.

#### Language: Delphi

## There are 2 variants: using recurrence relation and binet formula

---

### Code using recurrence relation:
#### This variant monitors the overflow of variables. In case of overflow, displays the previous values.
``` pascal
Program WarmUp2;
{
 There are red and green bacteria. Red turn green in one tact of time.
 Green in one tact of time are divided into two: red and green.
 Find the amount of red and green bacteria, and the total amount.
}

{$APPTYPE CONSOLE}

Var
  Red, NewRed, Green, NewGreen, Total, Tacts, k : integer;
  Overflow : boolean;
  //Red - amount of red bacteria in the current tact of time.
  //NewRed - the amount of red bacteria after one tact of time.
  //Green - amount of green bacteria in the current tact of time.
  //NewGreen - the amount of green bacteria after one tact of time.
  //Total - total number of bacteria
  //Tacts - total amount of tacts
  //k - counter for tacts of time
  //Overflow - overflow check

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

    //Start to iterate over each tact of time
    k:=1;
    while (k<=Tacts) and (Overflow=False) do
    begin

      //The new amount of green becomes the amount of green + red
      NewGreen := Green + Red;

      //The new amount of red becomes the amount of green before divided
      NewRed := Green;

      Total:= NewRed + NewGreen;

      //Checking if we got a negative number at some tact of time then a variable overflow occurred
      if (NewGreen<0) or (NewGreen<0) or (Total<0)  then
      begin

        //Write down on what tact of time it happened, in the total amount assign the previous values,
        //assign to the Overflow true and exit the cycle
        Tacts:= k;
        Total:= Red + Green;
        Overflow:= True;
      end
      //If there is no overflow, move on
      else
      begin

      //Before the next cycle, green before dividing becomes new green and red ones too
      Green := NewGreen;
      Red := NewRed
      end;

      //Increment k for the next step
      k:=k+1;
    end;

    //Checking if there is overflow
    if Overflow = False then
      Writeln('After ', Tacts, ' tacts of time, red became ', NewRed, ', green became ', NewGreen, '. The total number of bacteria: ', Total)
    else
    begin
      Writeln('At the ', Tacts,'th tacts of time, a variable overflow occurred!');
      Writeln('Therefore, the program can output values on the ', Tacts-1, 'th tacts of time.');
      Writeln('Red - ', Red, ', green - ', Green, '. The total number of bacteria: ', Total);
    end;
  end;

  Readln;
End.
```
### Code using binet formula:
#### This variant does not monitors the overflow of variables. In case of overflow, displays an error.
``` pascal
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
```
