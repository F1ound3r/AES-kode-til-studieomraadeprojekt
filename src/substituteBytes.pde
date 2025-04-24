int substituteBytes(int input){ //<>//
 int output = 0;

 int[] sboks = {
   99, 124, 119, 123, 242, 107, 111, 197, 48, 1, 103, 43, 254, 215, 171, 118,
   202, 130, 201, 125, 250, 89, 71, 240, 173, 212, 162, 175, 156, 164, 114, 192,
   183, 253, 147, 38, 54, 63, 247, 204, 52, 165, 229, 241, 113, 216, 49, 21,
   4, 199, 35, 195, 24, 150, 5, 154, 7, 18, 128, 226, 235, 39, 178, 117, 
   9, 131, 44, 26, 27, 110, 90, 160, 82, 59, 214, 179, 41, 227, 47, 132, 
   83, 209, 0, 237, 32, 252, 177, 91, 106, 203, 190, 57, 74, 76, 88, 207,
   208, 239, 170, 251, 67, 77, 51, 133, 69, 249, 2, 127, 80, 60, 159, 168,
   81, 163, 64, 143, 146, 157, 56, 245, 188, 182, 218, 33, 16, 255, 243, 210,
   205, 12, 19, 236, 95, 151, 68, 23, 196, 167, 126, 61, 100, 93, 25, 115,
   96, 129, 79, 220, 34, 42, 144, 136, 70, 238, 184, 20, 222, 94, 11, 219,
   224, 50, 58, 10, 73, 6, 36, 92, 194, 211, 172, 98, 145, 149, 228, 121,
   231, 200, 55, 109, 141, 213, 78, 169, 108, 86, 244, 234, 101, 122, 174, 8,
   186, 120, 37, 46, 28, 166, 180, 198, 232, 221, 116, 31, 75, 189, 139, 138,
   112, 62, 181, 102, 72, 3, 246, 14, 97, 53, 87, 185, 134, 193, 29, 158,
   225, 248, 152, 17, 105, 217, 142, 148, 155, 30, 135, 233, 206, 85, 40, 223,
   140, 161, 137, 13, 191, 230, 66, 104, 65, 153, 45, 15, 176, 84, 187, 22
  };
 
  output = sboks[input];
 
 return output;
}

/*
int substituteBytes(int input) { 
  int subbyte = 0;

  if (input == 0) {
    return 99;
  } else if (input == 1) {
    return 124;
  }

  subbyte = calculateT(input);
  subbyte = matrixCalculation(subbyte);

  return subbyte;
}

int matrixCalculation(int t) { //<>//
  int output = 0;

  int[] tValues = {0, 0, 0, 0, 0, 0, 0, 0};

  for (int i = 0; i < 8; i++) {

    if (binary(t, 8).charAt(8-i-1) == '1') {
      //tValues[8-i-1] ^= 1;
      tValues[i] ^= 1;
    }
  }




  int[] matrix1t1 = {tValues[0], 
               tValues[0] ^ tValues[1], 
         tValues[0] ^ tValues[1] ^ tValues[2], 
  tValues[0] ^ tValues[1] ^ tValues[2] ^ tValues[3]};
  
  int[] matrix1t2 = {tValues[4], 
              tValues[4] ^ tValues[5], 
        tValues[4] ^ tValues[5] ^ tValues[6], 
 tValues[4] ^ tValues[5] ^ tValues[6] ^ tValues[7]};
  
  int[] matrix2t1 = {tValues[3] ^ tValues[2] ^ tValues[1] ^ tValues[0], 
                          tValues[3] ^ tValues[2] ^ tValues[1], 
                              tValues[3] ^ tValues[2], 
                                    tValues[3]};
  
int[] matrix2t2 = {tValues[7] ^ tValues[6] ^ tValues[5] ^ tValues[4], 
                          tValues[7] ^ tValues[6] ^ tValues[5], 
                                tValues[7] ^ tValues[6], 
                                      tValues[7]};



  
   Da matrixerne er sat op:
   
   | M1T1 | M2T2 |
   | M2T1 | M1T2 |
   
   Så skal jeg xor m1t1 med m2t2 og m2t1 med m1t2
   

  int[] outputList = {0, 0, 0, 0, 0, 0, 0, 0};

  outputList[0] = matrix1t1[0] ^ matrix2t2[0];
  outputList[1] = matrix1t1[1] ^ matrix2t2[1];
  outputList[2] = matrix1t1[2] ^ matrix2t2[2];
  outputList[3] = matrix1t1[3] ^ matrix2t2[3];

  outputList[4] = matrix2t1[0] ^ matrix1t2[0];
  outputList[5] = matrix2t1[1] ^ matrix1t2[1];
  outputList[6] = matrix2t1[2] ^ matrix1t2[2];
  outputList[7] = matrix2t1[3] ^ matrix1t2[3];

  // Til sidst skal jeg tilføje bittet 01100011. Her skal det huskes at bit 0 er det første bit.


  outputList[0] ^= 1;
  outputList[1] ^= 1;
  outputList[2] ^= 0;
  outputList[3] ^= 0;
  outputList[4] ^= 0;
  outputList[5] ^= 1;
  outputList[6] ^= 1;
  outputList[7] ^= 0;



  for ( int i = 0; i < 8; i++) {
    output += outputList[i] << i;
  }

  return output;
}

int calculateT(int input) {
  int t = 0;
  int t0 = 0;
  int t1 = 1;

  int tæller = 283;
  int nævner = input;

  int[] divisionOutput = division(tæller, nævner);
  int quotient = 0;
  int remainder = 0;

  while ( remainder != 1) {



    divisionOutput = division(tæller, nævner);

    quotient = divisionOutput[0];
    remainder = divisionOutput[1];


    for (int j = 7; j > -1; j--) {
      if (binary(quotient, 8).charAt(j) == '1') {
        if ( t1 == 1) {

          t = quotient;

          break;
        }

        t ^= t1 << (j-8)*-1-1;
      }
    }

    t ^= t0;

    if (remainder == 1) {
      return t;
    }


    tæller = nævner;
    nævner = remainder;


    t0 = t1;
    t1 = t;
    t = 0;
  }

  return t;
}
*/
int[] division(int tæller, int nævner) {
  int quotient = 0;
  int index = 0;
  int remainder = tæller;
  int tempNævner = nævner;
  int mostSignificantBitITæller = 8; // Sat til 7 for at vælge det laveste bit

  while (true) {

    mostSignificantBitITæller = findMostSignificantBit(tæller);

    if (binary(tæller, 15).charAt(mostSignificantBitITæller) == binary(tempNævner,15).charAt(mostSignificantBitITæller)) { // Ændret fra 9

      tæller ^= tempNævner;
      tempNævner = nævner;

      quotient += 1 << index;
      index = 0;

      if (tæller > nævner) {

        int temp = tæller ^ nævner;

        if (temp == 1) {
          remainder = tæller;

          return new int[] {quotient, remainder};
        } else {
        }
      } else {
        remainder = tæller;
        
        return new int[] {quotient, remainder};
      }
    } else {
      index++;
      tempNævner = tempNævner << 1;
    }
  }
}

int findMostSignificantBit(int input) {

  if (input == 0) {
    return 0;
  }

  int mostSignificantBit = 14; // Fra 8 ÆNDRETTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT

  input /= 2;
  while (input != 0) {
    input /= 2;
    mostSignificantBit--;
  }
  return mostSignificantBit;
}
