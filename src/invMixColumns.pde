int[] invMixColumns(int inputList[]) {
  int[] output = new int[4];

  /*
   | 14  | 11  | 13  | 09  |
   | 09  | 14  | 11  | 13  |
   | 13  | 09  | 14  | 11  |
   | 11  | 13  | 09  | 14  |
   
   Hvilket også svarer til:
   
   | x^3+x^2+x^1 | x^3+x^1+x^0 | x^3+x^2+x^0 | x^3+x^0     |
   | x^3+x^0     | x^3+x^2+x^1 | x^3+x^1+x^0 | x^3+x^2+x^0 |
   | x^3+x^2+x^0 | x^3+x^0     | x^3+x^2+x^1 | x^3+x^1+x^0 |
   | x^3+x^1+x^0 | x^3+x^2+x^0 | x^3+x^0     | x^3+x^2+x^1 |
   
   */

  output[0] = multiplyByFourteen(inputList[0]) ^ multiplyByEleven(inputList[1]) ^ multiplyByThirteen(inputList[2]) ^ multiplyByNine(inputList[3]);
  output[1] = multiplyByNine(inputList[0]) ^ multiplyByFourteen(inputList[1]) ^ multiplyByEleven(inputList[2]) ^ multiplyByThirteen(inputList[3]);
  output[2] = multiplyByThirteen(inputList[0]) ^ multiplyByNine(inputList[1]) ^ multiplyByFourteen(inputList[2]) ^ multiplyByEleven(inputList[3]);
  output[3] = multiplyByEleven(inputList[0]) ^ multiplyByThirteen(inputList[1]) ^ multiplyByNine(inputList[2]) ^ multiplyByFourteen(inputList[3]);

  return output;
}
int multiplyByNine(int input) {
  int output = 0;

  // Her skal jeg gange med x^3 og x^0. Det kan gøres seperart og xors sammen:

  output = input << 3;
  output ^= input << 0;

  // Hvis output er større end 283 som er x^8x+4^x+3^x+1^x^0 skal det xors med dette polynomie.

  while (output > 255) {
    int difference = 6-findMostSignificantBit(output);

    output ^= 283 << difference;
  }


  /*
  if (output > 283) {
   // x^8x+4^x+3^x+1^x+0 skal skubbes så det største bit er det samme som det største bit i output
   
   int difference = 6-findMostSignificantBit(output);
   
   int[] divisionOutput = division(output, 283 << difference);
   output = divisionOutput[1]; // Skal bruge kvotienten og ikke resten.
   }
   */

  return output;
}
int multiplyByThirteen(int input) {
  int output = 0;

  // Her skal jeg gange med x^3, x^2 og x^0. Det kan gøres seperart og xors sammen:

  output = input << 3;
  output ^= input << 2;
  output ^= input << 0;

  // Hvis output er større end 283 som er x^8x+4^x+3^x+1^x^0 skal det xors med dette polynomie.

  while (output > 255) {
    int difference = 6-findMostSignificantBit(output);

    output ^= 283 << difference;
  }

  /*
  if (output > 283) {
   // x^8x+4^x+3^x+1^x+0 skal skubbes så det største bit er det samme som det største bit i output
   
   int difference = 6-findMostSignificantBit(output);
   
   int[] divisionOutput = division(output, 283 << difference);
   output = divisionOutput[1]; // Skal bruge kvotienten og ikke resten.
   }
   */
  return output;
}
int multiplyByEleven(int input) {
  int output = 0;

  // Her skal jeg gange med x^3, x^1 og x^0. Det kan gøres seperart og xors sammen:

  output = input << 3;
  output ^= input << 1;
  output ^= input << 0;

  // Hvis output er større end 283 som er x^8x+4^x+3^x+1^x^0 skal det xors med dette polynomie.


  while (output > 255) {
    int difference = 6-findMostSignificantBit(output);

    output ^= 283 << difference;
  }


  return output;
}
int multiplyByFourteen(int input) {
  int output = 0;

  // Her skal jeg gange med x^3, x^2 og x^1. Det kan gøres seperart og xors sammen:

  output = input << 3;
  output ^= input << 2;
  output ^= input << 1;
  
  // Hvis output er større end 283 som er x^8x+4^x+3^x+1^x^0 skal det xors med dette polynomie.
  while (output > 255) {
    int difference = 6-findMostSignificantBit(output);

    output ^= 283 << difference;
  }

  return output;
}
