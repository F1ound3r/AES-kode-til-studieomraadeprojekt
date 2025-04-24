int[] decrypt(int[] cipherText, int[] nøgleList) {

  int[] state = cipherText;
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

  //Her skal alting gøres baglæns. Så de sidste 16 bits fra roundKey skal xors med state

  for (int i = 0; i < 16; i++) {
    state[i] ^= expandedKey[i+16*(antalRunder)];
    println(expandedKey[i+16*(antalRunder)]);
  }


  //Efter det skal der køres antalRunder-1:
  for (int round = antalRunder-1; round != 0; round--) {
    // Shift rows

    state = invShiftRows(state);



    // SBOX
    for (int i = 0; i < 16; i++) {

      state[i] = inverseSubstituteBytes(state[i]);
    }


    // Add round key:
    for (int i = 0; i < 16; i++) {
      state[i] ^= expandedKey[i+(round-1)*16];
    }



    // Mix columns:
    int[] column1 = {state[0], state[1], state[2], state[3]};
    int[] column2 = {state[4], state[5], state[6], state[7]};
    int[] column3 = {state[8], state[9], state[10], state[11]};
    int[] column4 = {state[12], state[13], state[14], state[15]};

    column1 = invMixColumns(column1);
    column2 = invMixColumns(column2);
    column3 = invMixColumns(column3);
    column4 = invMixColumns(column4);


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
  }
  // Shift rows
  state = invShiftRows(state);


  // SBOX
  for (int i = 0; i < 16; i++) {
    state[i] =  inverseSubstituteBytes(state[i]);
  }



  for (int i = 0; i < 16; i++) {
    state[i] ^= expandedKey[i];
    
  }

  return state;
}
