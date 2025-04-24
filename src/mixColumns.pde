int[] mixColumns(int inputList[]) {
  int[] output = new int[4];

  /*
   | 02  | 03  | 01  | 01  |
   | 01  | 02  | 03  | 01  |
   | 01  | 01  | 02  | 03  |
   | 03  | 01  | 01  | 02  |
   
   Hvilket også svarer til:
   
   | x^1     | x^1+x^0 | x^0     | x^0     |
   | x^0     | x^1     | x^1+x^0 | x^0     |
   | x^0     | x^0     | x^1     | x^1+x^0 |
   | x^1+x^0 | x^0     | x^0     | x^1     |
   
   */

  output[0] = multiplyByTwo(inputList[0]) ^ multiplyByThree(inputList[1]) ^ inputList[2] ^ inputList[3];
  output[1] = inputList[0] ^ multiplyByTwo(inputList[1]) ^ multiplyByThree(inputList[2]) ^ inputList[3];
  output[2] = inputList[0] ^ inputList[1] ^ multiplyByTwo(inputList[2]) ^ multiplyByThree(inputList[3]);
  output[3] = multiplyByThree(inputList[0]) ^ inputList[1] ^ inputList[2] ^ multiplyByTwo(inputList[3]);

  return output;
}

int multiplyByTwo(int input) {
  int output = 0;

  // Her skal jeg gange med x^1, da jeg ganger med bittet 10 og dermed x^1.

  output = input << 1;

  // Hvis output har et bit på det 8ne bit 10000000, så skal det xors med samme polynomie som  i divison: x^8+x^4+x^3+x^1+x^0 som også hedder 283 som integer.

  if (binary(output, 9).charAt(0) == '1') {
    output ^= 283;
  }

  return output;
}

int multiplyByThree(int input) {
  int  output = 0;

  // Her skal jeg gange meed bittet 11, dermed skal jeg gange med x^1 og x^0. Det vil være det samme som at gange med x^1 og xor med sig selv.

  output = (input << 1) ^ input;

  // Hvis output har et bit på det 8ne bit 10000000, så skal det xors med samme polynomie som  i divison: x^8+x^4+x^3+x^1+x^0 som også hedder 283 som integer.

  if (binary(output, 9).charAt(0) == '1') {
    output ^= 283;
  }

  return output;
}
