int[] calculateRoundKey8(int[] inputList) { //<>// //<>//

  int[] expandedKey = new int[(antalRunder+1)*16]; //Laver den udvidede nøgle med den korrekte størrelse.

  // Kopierer inputList over til den udvidede nøgle.
  // Der skal lave en ny nøgle antalRunder + 1 gange, da det første sæt er den originale nøgle.
  expandedKey[0] = inputList[0];
  
  int rconIteration = 1;

  // Laver de forskellige ord herude. Her bliver ordene gjort kortere for at kunne gøre udregninger på dem. Så istedet for at have en længde på 4 bit så er det nu en længde på 1 bit.
  int[] word0 = new int[1];
  int[] word1 = new int[1];
  int[] word2 = new int[1];
  int[] word3 = new int[1];
  
  for (int i = 0; i < antalRunder+104; i++) {

    //Til at starte med deles den  tidligere bytes op i et ord.
    for (int copy = 0; copy < 1; copy++) {
      word0[copy] = expandedKey[copy + 0 + i];
      word1[copy] = expandedKey[copy + 1 + i];
    }

    //Det første ord skal i keyExpansionCore dermed:
    word2 = keyExpansionCoreNew(word1, rconIteration++); //rconIteration forøges hver gang dette køres.

    // Da word2 skal bruges i helhed kopieres det over først inden de andre bliver beregnet.
    for (int iteration = 0; iteration < 1; iteration++) {
      word2[iteration] ^= word0[iteration];
    }

    //De andre ord laves ud fra at XOR word1 med word4, word2 med word5 osv.
    for (int copy = 0; copy < 1; copy++) {
      word3[copy] = word1[copy] ^ word2[copy];
    }

    // Nu hvor den udvidede nøgle er lavet skal det sættes ind i expandedKey
    for (int copy = 0; copy < 1; copy++) {
      expandedKey[i+copy+1 ] = word2[copy];
      expandedKey[i+copy+2] = word3[copy];
    }
  }
  println(expandedKey);
  return expandedKey;
}
int[] calculateRoundKey16(int[] inputList) {

  int[] expandedKey = new int[(antalRunder+1)*16]; //Laver den udvidede nøgle med den korrekte størrelse.

  // Kopierer inputList over til den udvidede nøgle.
  // Der skal lave en ny nøgle antalRunder + 1 gange, da det første sæt er den originale nøgle.
  for (int i = 0; i < 2; i++) {
    expandedKey[i] = inputList[i];
  }
  
  int rconIteration = 1;

  // Laver de forskellige ord herude. Her bliver ordene gjort kortere for at kunne gøre udregninger på dem. Så istedet for at have en længde på 4 bit så er det nu en længde på 1 bit.
  int[] word0 = new int[1];
  int[] word1 = new int[1];
  int[] word2 = new int[1];
  int[] word3 = new int[1];
  
  for (int i = 0; i < antalRunder+104; i++) {

    //Til at starte med deles den  tidligere bytes op i et ord.
    for (int copy = 0; copy < 1; copy++) {
      word0[copy] = expandedKey[copy + 0 + i];
      word1[copy] = expandedKey[copy + 1 + i];
    }

    //Det første ord skal i keyExpansionCore dermed:
    word2 = keyExpansionCoreNew(word1, rconIteration++); //rconIteration forøges hver gang dette køres.

    // Da word2 skal bruges i helhed kopieres det over først inden de andre bliver beregnet.
    for (int iteration = 0; iteration < 1; iteration++) {
      word2[iteration] ^= word0[iteration];
    }

    //De andre ord laves ud fra at XOR word1 med word4, word2 med word5 osv.
    for (int copy = 0; copy < 1; copy++) {
      word3[copy] = word1[copy] ^ word2[copy];
    }

    // Nu hvor den udvidede nøgle er lavet skal det sættes ind i expandedKey
    for (int copy = 0; copy < 1; copy++) {
      expandedKey[i+copy+1 ] = word2[copy];
      expandedKey[i+copy+2] = word3[copy];
    }
  }
  println(expandedKey);
  return expandedKey;
}

int[] calculateRoundKey32(int[] inputList) {

  int[] expandedKey = new int[(antalRunder+1)*16]; //Laver den udvidede nøgle med den korrekte størrelse.

  // Kopierer inputList over til den udvidede nøgle.
  // Der skal lave en ny nøgle antalRunder + 1 gange, da det første sæt er den originale nøgle.
  for (int i = 0; i < 4; i++) {
    expandedKey[i] = inputList[i];
  }

  int rconIteration = 1;

  // Laver de forskellige ord herude, så de ikke laves igen og igen en masse gange.
  int[] word0 = new int[4];
  int[] word1 = new int[4];

  for (int i = 0; i < antalRunder+23; i++) {

    //Til at starte med deles den  tidligere bytes op i et ord.
    for (int copy = 0; copy < 4; copy++) {
      word0[copy] = expandedKey[copy + 0 + 4*i];
    }

    //Det første ord skal i keyExpansionCore dermed:
    word1 = keyExpansionCore(word0, rconIteration++); //rconIteration forøges hver gang dette køres.

    // Da word2 skal bruges i helhed kopieres det over først inden de andre bliver beregnet.
    for (int iteration = 0; iteration < 4; iteration++) {
      word1[iteration] ^= word0[iteration];
    }

    //De andre ord laves ud fra at XOR word1 med word4, word2 med word5 osv.
    for (int copy = 0; copy < 4; copy++) {
      word0[copy] = word1[copy] ^ word0[copy];
    }

    // Nu hvor den udvidede nøgle er lavet skal det sættes ind i expandedKey
    for (int copy = 0; copy < 4; copy++) {
      expandedKey[i*4+copy+4 ] = word0[copy];
      expandedKey[i*4+copy+8] = word1[copy];
    }
  }
  return expandedKey;
}
int[] calculateRoundKey64(int[] inputList) {

  int[] expandedKey = new int[(antalRunder+1)*16]; //Laver den udvidede nøgle med den korrekte størrelse.

  // Kopierer inputList over til den udvidede nøgle.
  // Der skal lave en ny nøgle antalRunder + 1 gange, da det første sæt er den originale nøgle.
  for (int i = 0; i < 8; i++) {
    expandedKey[i] = inputList[i];
  }

  int rconIteration = 1;

  // Laver de forskellige ord herude, så de ikke laves igen og igen en masse gange.
  int[] word0 = new int[4];
  int[] word1 = new int[4];
  int[] word2 = new int[4];
  int[] word3 = new int[4];

  for (int i = 0; i < antalRunder+9; i++) {

    //Til at starte med deles de 8 tidligere bytes op i 2 ord.
    for (int copy = 0; copy < 4; copy++) {
      word0[copy] = expandedKey[copy + 0 + 8*i];
      word1[copy] = expandedKey[copy + 4 + 8*i];
    }

    //Det første ord skal i keyExpansionCore dermed:
    word2 = keyExpansionCore(word1, rconIteration++); //rconIteration forøges hver gang dette køres.

    // Da word2 skal bruges i helhed kopieres det over først inden de andre bliver beregnet.
    for (int iteration = 0; iteration < 4; iteration++) {
      word2[iteration] ^= word0[iteration];
    }

    //De andre ord laves ud fra at XOR word1 med word4, word2 med word5 osv.
    for (int copy = 0; copy < 4; copy++) {
      word3[copy] = word2[copy] ^ word0[copy];
    }

    // Nu hvor den udvidede nøgle er lavet skal det sættes ind i expandedKey
    for (int copy = 0; copy < 4; copy++) {
      expandedKey[i*8+copy+8 ] = word2[copy];
      expandedKey[i*8+copy+12] = word3[copy];
    }
  }
  return expandedKey;
}

int[] calculateRoundKey96(int[] inputList) {

  int[] expandedKey = new int[(antalRunder+1)*16]; //Laver den udvidede nøgle med den korrekte størrelse.

  // Kopierer inputList over til den udvidede nøgle.
  // Der skal lave en ny nøgle antalRunder + 1 gange, da det første sæt er den originale nøgle.
  for (int i = 0; i < 12; i++) {
    expandedKey[i] = inputList[i];
  }
  println("info");
  int rconIteration = 1;

  // Laver de forskellige ord herude, så de ikke laves igen og igen en masse gange.
  int[] word0 = new int[4];
  int[] word1 = new int[4];
  int[] word2 = new int[4];
  int[] word3 = new int[4];
  int[] word4 = new int[4];
  int[] word5 = new int[4];

  for (int i = 0; i < antalRunder+3; i++) {

    //Til at starte med deles de 16 tidligere bytes op i 4 ord.
    for (int copy = 0; copy < 4; copy++) {
      word0[copy] = expandedKey[copy + 0  + 12*i];
      word1[copy] = expandedKey[copy + 4  + 12*i];
      word2[copy] = expandedKey[copy + 8  + 12*i];
    }

    //Det første ord skal i keyExpansionCore dermed:
    word3 = keyExpansionCore(word2, rconIteration++); //rconIteration forøges hver gang dette køres.

    // Da word4 skal bruges i helhed kopieres det over først inden de andre bliver beregnet.
    for (int iteration = 0; iteration < 4; iteration++) {
      word3[iteration] ^= word0[iteration];
    }

    //De andre ord laves ud fra at XOR word1 med word4, word2 med word5 osv.
    for (int copy = 0; copy < 4; copy++) {
      word4[copy] = word1[copy] ^ word3[copy];
      word5[copy] = word2[copy] ^ word4[copy];
    }

    // Nu hvor den udvidede nøgle er lavet skal det sættes ind i expandedKey
    for (int copy = 0; copy < 4; copy++) {
      expandedKey[i*12+copy+12] = word3[copy];
      expandedKey[i*12+copy+16] = word4[copy];
      expandedKey[i*12+copy+20] = word5[copy];
    }
  }
  return expandedKey;
}

int[] calculateRoundKey128(int[] inputList) {

  int[] expandedKey = new int[(antalRunder+1)*16]; //Laver den udvidede nøgle med den korrekte størrelse.

  // Kopierer inputList over til den udvidede nøgle.
  // Der skal lave en ny nøgle antalRunder + 1 gange, da det første sæt er den originale nøgle.
  for (int i = 0; i < 16; i++) {
    expandedKey[i] = inputList[i];
  }

  int rconIteration = 1;

  // Laver de forskellige ord herude, så de ikke laves igen og igen en masse gange.
  int[] word0 = new int[4];
  int[] word1 = new int[4];
  int[] word2 = new int[4];
  int[] word3 = new int[4];
  int[] word4 = new int[4];
  int[] word5 = new int[4];
  int[] word6 = new int[4];
  int[] word7 = new int[4];

  for (int i = 0; i < antalRunder; i++) {

    //Til at starte med deles de 16 tidligere bytes op i 4 ord.
    for (int copy = 0; copy < 4; copy++) {
      word0[copy] = expandedKey[copy + 0  + 16*i];
      word1[copy] = expandedKey[copy + 4  + 16*i];
      word2[copy] = expandedKey[copy + 8  + 16*i];
      word3[copy] = expandedKey[copy + 12 + 16*i];
    }

    //Det første ord skal i keyExpansionCore dermed:
    word4 = keyExpansionCore(word3, rconIteration++); //rconIteration forøges hver gang dette køres.

    // Da word4 skal bruges i helhed kopieres det over først inden de andre bliver beregnet.
    for (int iteration = 0; iteration < 4; iteration++) {
      word4[iteration] ^= word0[iteration];
    }

    //De andre ord laves ud fra at XOR word1 med word4, word2 med word5 osv.
    for (int copy = 0; copy < 4; copy++) {
      word5[copy] = word1[copy] ^ word4[copy];
      word6[copy] = word2[copy] ^ word5[copy];
      word7[copy] = word3[copy] ^ word6[copy];
    }

    // Nu hvor den udvidede nøgle er lavet skal det sættes ind i expandedKey
    for (int copy = 0; copy < 4; copy++) {
      expandedKey[i*16+copy+16] = word4[copy];
      expandedKey[i*16+copy+20] = word5[copy];
      expandedKey[i*16+copy+24] = word6[copy];
      expandedKey[i*16+copy+28] = word7[copy];
    }
  }
  return expandedKey;
}

int[] calculateRoundKey160(int[] inputList) {

  int[] expandedKey = new int[(antalRunder+1)*16]; //Laver den udvidede nøgle med den korrekte størrelse.

  // Kopierer inputList over til den udvidede nøgle.
  // Der skal lave en ny nøgle antalRunder + 1 gange, da det første sæt er den originale nøgle.
  for (int i = 0; i < 20; i++) {
    expandedKey[i] = inputList[i];
  }

  int rconIteration = 1;

  // Laver de forskellige ord herude, så de ikke laves igen og igen en masse gange.
  int[] word0 = new int[4];
  int[] word1 = new int[4];
  int[] word2 = new int[4];
  int[] word3 = new int[4];
  int[] word4 = new int[4];
  int[] word5 = new int[4];
  int[] word6 = new int[4];
  int[] word7 = new int[4];
  int[] word8 = new int[4];
  int[] word9 = new int[4];

  for (int i = 0; i < antalRunder-3; i++) {
    //Til at starte med deles de 16 tidligere bytes op i 4 ord.
    for (int copy = 0; copy < 4; copy++) {
      word0[copy] = expandedKey[copy + 0  + 20*i];
      word1[copy] = expandedKey[copy + 4  + 20*i];
      word2[copy] = expandedKey[copy + 8  + 20*i];
      word3[copy] = expandedKey[copy + 12 + 20*i];
      word4[copy] = expandedKey[copy + 16 + 20*i];
    }

    //Det første ord skal i keyExpansionCore dermed:
    word5 = keyExpansionCore(word4, rconIteration++); //rconIteration forøges hver gang dette køres.

    // Da word4 skal bruges i helhed kopieres det over først inden de andre bliver beregnet.
    for (int iteration = 0; iteration < 4; iteration++) {
      word5[iteration] ^= word0[iteration];
    }

    //De andre ord laves ud fra at XOR word1 med word4, word2 med word5 osv.
    for (int copy = 0; copy < 4; copy++) {
      word6[copy] = word1[copy] ^ word5[copy];
      word7[copy] = word2[copy] ^ word6[copy];
      word8[copy] = word3[copy] ^ word7[copy];
      word9[copy] = word4[copy] ^ word8[copy];
    }

    // Nu hvor den udvidede nøgle er lavet skal det sættes ind i expandedKey
    for (int copy = 0; copy < 4; copy++) {
      expandedKey[i*20+copy+20] = word5[copy];
      expandedKey[i*20+copy+24] = word6[copy];
      expandedKey[i*20+copy+28] = word7[copy];
      expandedKey[i*20+copy+32] = word8[copy];
      expandedKey[i*20+copy+36] = word9[copy];
    }
  }
  return expandedKey;
}
int[] calculateRoundKey192(int[] inputList) {

  int[] expandedKey = new int[(antalRunder+1)*16]; //Laver den udvidede nøgle med den korrekte størrelse.

  // Kopierer inputList over til den udvidede nøgle.
  // Der skal lave en ny nøgle antalRunder + 1 gange, da det første sæt er den originale nøgle.
  for (int i = 0; i < 24; i++) {
    expandedKey[i] = inputList[i];
  }

  int rconIteration = 1;

  // Laver de forskellige ord herude, så de ikke laves igen og igen en masse gange.
  int[] word0 = new int[4];
  int[] word1 = new int[4];
  int[] word2 = new int[4];
  int[] word3 = new int[4];
  int[] word4 = new int[4];
  int[] word5 = new int[4];
  int[] word6 = new int[4];
  int[] word7 = new int[4];
  int[] word8 = new int[4];
  int[] word9 = new int[4];
  int[] word10 = new int[4];
  int[] word11 = new int[4];

  for (int i = 0; i < antalRunder-5; i++) {
    //Til at starte med deles de 20 tidligere bytes op i 4 ord.
    for (int copy = 0; copy < 4; copy++) {
      word0[copy] = expandedKey[copy + 0  + 24*i];
      word1[copy] = expandedKey[copy + 4  + 24*i];
      word2[copy] = expandedKey[copy + 8  + 24*i];
      word3[copy] = expandedKey[copy + 12 + 24*i];
      word4[copy] = expandedKey[copy + 16 + 24*i];
      word5[copy] = expandedKey[copy + 20 + 24*i];
    }

    //Det første ord skal i keyExpansionCore dermed:
    word6 = keyExpansionCore(word5, rconIteration++); //rconIteration forøges hver gang dette køres.

    // Da word4 skal bruges i helhed kopieres det over først inden de andre bliver beregnet.
    for (int iteration = 0; iteration < 4; iteration++) {
      word6[iteration] ^= word0[iteration];
    }

    //De andre ord laves ud fra at XOR word1 med word4, word2 med word5 osv.
    for (int copy = 0; copy < 4; copy++) {
      word7[copy] = word1[copy] ^ word6[copy];
      word8[copy] = word2[copy] ^ word7[copy];
      word9[copy] = word3[copy] ^ word8[copy];
      word10[copy] = word4[copy] ^ word9[copy];
      word11[copy] = word5[copy] ^ word10[copy];
    }
    // Nu hvor den udvidede nøgle er lavet skal det sættes ind i expandedKey
    for (int copy = 0; copy < 4; copy++) {
      expandedKey[i*24+copy+24] = word6[copy];
      expandedKey[i*24+copy+28] = word7[copy];
      expandedKey[i*24+copy+32] = word8[copy];
      expandedKey[i*24+copy+36] = word9[copy];
      expandedKey[i*24+copy+40] = word10[copy];
      expandedKey[i*24+copy+44] = word11[copy];
    }
  }
  return expandedKey;
}
int[] calculateRoundKey224(int[] inputList) {

  int[] expandedKey = new int[(antalRunder+1)*16]; //Laver den udvidede nøgle med den korrekte størrelse.

  // Kopierer inputList over til den udvidede nøgle.
  // Der skal lave en ny nøgle antalRunder + 1 gange, da det første sæt er den originale nøgle.
  for (int i = 0; i < 28; i++) {
    expandedKey[i] = inputList[i];
  }

  int rconIteration = 1;

  // Laver de forskellige ord herude, så de ikke laves igen og igen en masse gange.
  int[] word0 = new int[4];
  int[] word1 = new int[4];
  int[] word2 = new int[4];
  int[] word3 = new int[4];
  int[] word4 = new int[4];
  int[] word5 = new int[4];
  int[] word6 = new int[4];
  int[] word7 = new int[4];
  int[] word8 = new int[4];
  int[] word9 = new int[4];
  int[] word10 = new int[4];
  int[] word11 = new int[4];
  int[] word12 = new int[4];
  int[] word13 = new int[4];

  for (int i = 0; i < antalRunder-6; i++) {
    //Til at starte med deles de 24 tidligere bytes op i 4 ord.
    for (int copy = 0; copy < 4; copy++) {
      word0[copy] = expandedKey[copy + 0  + 28*i];
      word1[copy] = expandedKey[copy + 4  + 28*i];
      word2[copy] = expandedKey[copy + 8  + 28*i];
      word3[copy] = expandedKey[copy + 12 + 28*i];
      word4[copy] = expandedKey[copy + 16 + 28*i];
      word5[copy] = expandedKey[copy + 20 + 28*i];
      word6[copy] = expandedKey[copy + 24 + 28*i];
    }

    //Det første nye ord skal i keyExpansionCore dermed:
    word7 = keyExpansionCore(word6, rconIteration++); //rconIteration forøges hver gang dette køres.

    // Da word4 skal bruges i helhed kopieres det over først inden de andre bliver beregnet.
    for (int iteration = 0; iteration < 4; iteration++) {
      word7[iteration] ^= word0[iteration];
    }

    //De andre ord laves ud fra at XOR word1 med word4, word2 med word5 osv.
    for (int copy = 0; copy < 4; copy++) {
      word8[copy] = word1[copy] ^ word7[copy];
      word9[copy] = word2[copy] ^ word8[copy];
      word10[copy] = word3[copy] ^ word9[copy];
      word11[copy] = word4[copy] ^ word10[copy];
      word12[copy] = word5[copy] ^ word11[copy];
      word13[copy] = word6[copy] ^ word12[copy];
    }

    // Nu hvor den udvidede nøgle er lavet skal det sættes ind i expandedKey
    for (int copy = 0; copy < 4; copy++) {
      expandedKey[i*28+copy+28] = word7[copy];
      expandedKey[i*28+copy+32] = word8[copy];
      expandedKey[i*28+copy+36] = word9[copy];
      expandedKey[i*28+copy+40] = word10[copy];
      expandedKey[i*28+copy+44] = word11[copy];
      expandedKey[i*28+copy+48] = word12[copy];
      expandedKey[i*28+copy+52] = word13[copy];
    }
  }
  return expandedKey;
}
int[] calculateRoundKey256(int[] inputList) {

  int[] expandedKey = new int[(antalRunder+1)*16]; //Laver den udvidede nøgle med den korrekte størrelse.

  // Kopierer inputList over til den udvidede nøgle.
  // Der skal lave en ny nøgle antalRunder + 1 gange, da det første sæt er den originale nøgle.
  for (int i = 0; i < 32; i++) {
    expandedKey[i] = inputList[i];
  }

  int rconIteration = 1;

  // Laver de forskellige ord herude, så de ikke laves igen og igen en masse gange.
  int[] word0 = new int[4];
  int[] word1 = new int[4];
  int[] word2 = new int[4];
  int[] word3 = new int[4];
  int[] word4 = new int[4];
  int[] word5 = new int[4];
  int[] word6 = new int[4];
  int[] word7 = new int[4];
  int[] word8 = new int[4];
  int[] word9 = new int[4];
  int[] word10 = new int[4];
  int[] word11 = new int[4];
  int[] word12 = new int[4];
  int[] word13 = new int[4];
  int[] word14 = new int[4];
  int[] word15 = new int[4];

  for (int i = 0; i < antalRunder-8; i++) {
    //Til at starte med deles de 24 tidligere bytes op i 4 ord.
    for (int copy = 0; copy < 4; copy++) {
      word0[copy] = expandedKey[copy + 0  + 32*i];
      word1[copy] = expandedKey[copy + 4  + 32*i];
      word2[copy] = expandedKey[copy + 8  + 32*i];
      word3[copy] = expandedKey[copy + 12 + 32*i];
      word4[copy] = expandedKey[copy + 16 + 32*i];
      word5[copy] = expandedKey[copy + 20 + 32*i];
      word6[copy] = expandedKey[copy + 24 + 32*i];
      word7[copy] = expandedKey[copy + 28 + 32*i];
    }

    //Det første nye ord skal i keyExpansionCore dermed:
    word8 = keyExpansionCore(word7, rconIteration++); //rconIteration forøges hver gang dette køres.

    // Da word4 skal bruges i helhed kopieres det over først inden de andre bliver beregnet.
    for (int iteration = 0; iteration < 4; iteration++) {
      word8[iteration] ^= word0[iteration];
    }


    for (int copy = 0; copy < 4; copy++) {
      word9[copy] = word1[copy] ^ word8[copy];
      word10[copy] = word2[copy] ^ word9[copy];
      word11[copy] = word3[copy] ^ word10[copy];
    }
    // I 256 skal word11 substitute bruges til at finde word 12. Dermed laves der et temp ord.
    int[] substituteWord11 = new int[4];

    for (int iteration = 0; iteration < 4; iteration++) {
      substituteWord11[iteration] = substituteBytes(word11[iteration]);
    }
    //Når det er gjort kan dee sidste udregnes.
    for (int copy = 0; copy < 4; copy++) {
      word12[copy] = word4[copy] ^ substituteWord11[copy];
      word13[copy] = word5[copy] ^ word12[copy];
      word14[copy] = word6[copy] ^ word13[copy];
      word15[copy] = word7[copy] ^ word14[copy];
    }

    // Nu hvor den udvidede nøgle er lavet skal det sættes ind i expandedKey
    for (int copy = 0; copy < 4; copy++) {
      expandedKey[i*32+copy+32] = word8[copy];
      expandedKey[i*32+copy+36] = word9[copy];
      expandedKey[i*32+copy+40] = word10[copy];
      expandedKey[i*32+copy+44] = word11[copy];
      expandedKey[i*32+copy+48] = word12[copy];
      expandedKey[i*32+copy+52] = word13[copy];
      expandedKey[i*32+copy+56] = word14[copy];
      expandedKey[i*32+copy+60] = word15[copy];
    }
  }
  println(expandedKey);
  return expandedKey;
}
int[] keyExpansionCore(int[] inputList, int iteration) {

  int[] output = new int[4];

  // Roterer
  output[0] = inputList[1];
  output[1] = inputList[2];
  output[2] = inputList[3];
  output[3] = inputList[0];

  // Substitute bytes
  output[0] = substituteBytes(output[0]);
  output[1] = substituteBytes(output[1]);
  output[2] = substituteBytes(output[2]);
  output[3] = substituteBytes(output[3]);

  // RCon (Round Constant)
  // Udregnes med 2^(iteration-1)
  output[0] ^= int(pow(2, iteration-1));

  while (output[0] > 255) {
    int difference = 6-findMostSignificantBit(output[0]);

    output[0] ^= 283 << difference;
    // Finder forskellen i det største bit for at kunne dividere output[0] med x^8+x^4+x^3+x^1+x^0 skubbet så x^8 bliver forskudt til den største bit i output[0].
    // Det gør at der fåes den korrekte Round Constant og at det passer ind i en byte.
    /*
    if (output[0] > 32768){
     int difference = 6-findMostSignificantBit(output[0]);
     
     output[0] ^= 283 << difference;
     
     }
     
     int difference = 6-findMostSignificantBit(output[0]);
     
     int[] divisionOutput = division(output[0], 283 << difference);
     output[0] = divisionOutput[1]; // Skal bruge resten og ikke kvotienten.
     */
  }

  return output;
}
int[] keyExpansionCoreNew(int[] inputList, int iteration) {

  int[] output = new int[1];

  // Roterer
  output[0] = inputList[0];

  // Substitute bytes
  output[0] = substituteBytes(output[0]);

  // RCon (Round Constant)
  // Udregnes med 2^(iteration-1)
  output[0] ^= int(pow(2, iteration-1));

  while (output[0] > 255) {
    int difference = 6-findMostSignificantBit(output[0]);

    output[0] ^= 283 << difference;
    // Finder forskellen i det største bit for at kunne dividere output[0] med x^8+x^4+x^3+x^1+x^0 skubbet så x^8 bliver forskudt til den største bit i output[0].
    // Det gør at der fåes den korrekte Round Constant og at det passer ind i en byte.
    /*
    if (output[0] > 32768){
     int difference = 6-findMostSignificantBit(output[0]);
     
     output[0] ^= 283 << difference;
     
     }
     
     int difference = 6-findMostSignificantBit(output[0]);
     
     int[] divisionOutput = division(output[0], 283 << difference);
     output[0] = divisionOutput[1]; // Skal bruge resten og ikke kvotienten.
     */
  }

  return output;
}
