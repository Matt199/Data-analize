Table tableSolar, tableTemp, tablePres;
int i, j, k;
float sredniaSolar, sredniaTemp;
float x;

void setup(){
  size(1000,800);
  background(51);
  tableSolar = loadTable("solar radiation.csv");
  tableTemp = loadTable("temperature.csv");
  tablePres = loadTable("barometric pressure.csv");
  i = 0;
  j = 0;
  k++;
  sredniaSolar = 0;
  sredniaTemp = 0;
}

void draw() {
   
  rect(0 + i, 700 - tableSolar.getFloat(j, 4)*0.2, 1, 1);
  fill(255, 0 ,0 );
  rect(0 + i, 700 - tableTemp.getInt(j, 4)*10, 1, 1);
  fill(0, 255 ,0 );
  println(tablePres.getFloat(j,4));
  x = map(tablePres.getFloat(j,4), 30.3, 30.6, 0, 100);
  println(x);
  rect(0 + i, 700 - x, 2, 2);
  fill(255);
  noStroke();
  while (i < 1500) {
    i += 1;
    j++;
    break;
  }
  if (tableSolar.getFloat(j, 4) > 10){
    sredniaSolar = sredniaSolar + tableSolar.getFloat(j, 4);
    k++;
  }
  if (j%280 == 0) {
   println("Suma " + sredniaSolar);
   println("Liczba k " + k);
   sredniaSolar /= k;
   println("Srednia " + sredniaSolar);
   k = 0;
  }
  
}