int[] shiftRows(int[] input){
   int[] output = new int[16];
  /*
  Her går man fra matrixen der ser således ud:
  | 0   | 4   | 8   | 12  |
  | 1   | 5   | 9   | 13  |
  | 2   | 6   | 10  | 14  |
  | 3   | 7   | 11  | 15  |
  
  Til en der ser således ud:
  
  | 0   | 4   | 8   | 12  |
  | 5   | 9   | 13  | 1   |
  | 10  | 14  | 2   | 6   |
  | 15  | 3   | 7   | 11  |
  
  */
  
  output[0] = input[0];
  output[1] = input[5];
  output[2] = input[10];
  output[3] = input[15];
  
  output[4] = input[4];
  output[5] = input[9];
  output[6] = input[14];
  output[7] = input[3];
  
  output[8] = input[8];
  output[9] = input[13];
  output[10] = input[2];
  output[11] = input[7];
  
  output[12] = input[12];
  output[13] = input[1];
  output[14] = input[6];
  output[15] = input[11];
  
  return output;
}
