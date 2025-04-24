int[] encrypt(int[] plainText, int[] nøgleList) {

  int[] state = plainText;
  int[] expandedKey = new int[(antalRunder+1)*16]; //Laver den udvidede nøgle med den korrekte størrelse.

  if (antalRunder == 6) {
    expandedKey = calculateRoundKey8(nøgleList);
  } else if (antalRunder == 7) {
    expandedKey = calculateRoundKey32(nøgleList);
  } else if (antalRunder == 8) {
    expandedKey = calculateRoundKey64(nøgleList);
  } else if (antalRunder == 9) {
    expandedKey = calculateRoundKey96(nøgleList);
  } else if (antalRunder == 10) {
    expandedKey =  calculateRoundKey128(nøgleList);
  } else if (antalRunder == 11) {
    expandedKey =  calculateRoundKey160(nøgleList);
  } else if (antalRunder == 12) {
    expandedKey =  calculateRoundKey192(nøgleList);
  } else if (antalRunder == 13) {
    expandedKey =  calculateRoundKey224(nøgleList);
  } else if (antalRunder == 14) {
    expandedKey =  calculateRoundKey256(nøgleList);
  }

  // Det første der skal gøres er at round key skal tilføjes til state:

  for (int i = 0; i < 16; i++) {
    state[i] ^= expandedKey[i];
  }

  // Så skal der for antalRunder-1 gøres: Sbytes-> shift rows -> mix columns -> addRoundKey.
  //Dermed:

  for (int round = 0; round < antalRunder-1; round++) {
    // SBOX
    for (int i = 0; i < 16; i++) {
      state[i] =  substituteBytes(state[i]);
    }



    // Shift rows
    state = shiftRows(state);

 

    // Mix columns:
    int[] column1 = {state[0], state[1], state[2], state[3]};
    int[] column2 = {state[4], state[5], state[6], state[7]};
    int[] column3 = {state[8], state[9], state[10], state[11]};
    int[] column4 = {state[12], state[13], state[14], state[15]};

    column1 = mixColumns(column1);
    column2 = mixColumns(column2);
    column3 = mixColumns(column3);
    column4 = mixColumns(column4);

    for (int i = 0; i < 16; i++) {
      if (i < 4) {
        state[i] = column1[i];
      } else if (i < 8) {
        state[i] = column2[i % 4];
      } else if (i < 12) {
        state[i] = column3[i % 4];
      } else {
        state[i] = column4[i % 4];
      }
    }


    // Add round key:
    for (int i = 0; i < 16; i++) {
      state[i] ^= expandedKey[i+round*16];

    }



  }
  // SBOX
  for (int i = 0; i < 16; i++) {
    state[i] =  substituteBytes(state[i]);
  }



  // Shift rows
  state = shiftRows(state);




  for (int i = 0; i < 16; i++) {
    state[i] ^= expandedKey[i+16*(antalRunder)];
    println(expandedKey[i+16*(antalRunder)]);
  }

  return state;
}
