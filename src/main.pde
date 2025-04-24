// Det her er som udgangspunkt 128 bit. Dermed
int antalRunder = 14;

void setup() {

  int[] input = {0, 1, 2, 3, 4, 5, 6, 7};
  //println(calculateRoundKey64(input));


  //String nøgle128 = "Thats my Kung Fu";
  int[] nøgle256 = {84, 104, 97, 116, 115, 32, 109, 121, 32, 75, 117, 110, 103, 32, 70, 117, 234, 12, 54, 125, 9, 15, 236, 1, 123, 57, 243, 33, 125, 5, 42, 6};
  int[] nøgle224 = {84, 104, 97, 116, 115, 32, 109, 121, 32, 75, 117, 110, 103, 32, 70, 117, 234, 12, 54, 125, 9, 15, 236, 1, 123, 57, 243, 33};
  int[] nøgle192 = {84, 104, 97, 116, 115, 32, 109, 121, 32, 75, 117, 110, 103, 32, 70, 117, 234, 12, 54, 125, 9, 15, 236, 1};
  int[] nøgle160 = {84, 104, 97, 116, 115, 32, 109, 121, 32, 75, 117, 110, 103, 32, 70, 117, 234, 12, 54, 125};
  int[] nøgle128 = {84, 104, 97, 116, 115, 32, 109, 121, 32, 75, 117, 110, 103, 32, 70, 117};
  int[] nøgle96 = {84, 104, 97, 116, 115, 32, 109, 121, 32, 75, 117, 110};
  int[] nøgle64 = {84, 104, 97, 116, 115, 32, 109, 121};
  int[] nøgle32 = {84, 104, 97, 116};
  int[] nøgle16 = {84, 104};
  int[] nøgle8 = {84};
  String plainText = "Krypteringstekst";
  
  int[] nøgleGæt = new int[4];

  //int[] cifferTekst = {41,195,80,95,87,20,32,246,64,34,153,179,26,2,215,58};

  //Konverterer inputString om til en charListe.
  char[] plainTextCharList = plainText.toCharArray();

  int[] state = new int[16];

  // Konvererterer plantext over til integers ved brug af ascii.
  for (int i = 0; i < 16; i++) {
    state[i] = char(plainTextCharList[i]);
  }
  int[] encryptionOutput = new int[(antalRunder+1)*16];
  int[] decryptOutput = new int[(antalRunder+1)*16];
  //encryptionOutput = encrypt(state, nøgle128);
  /*
  while (nøgleGæt[0] != nøgle32[0] || nøgleGæt[1] != nøgle32[1] || nøgleGæt[2] != nøgle32[2] || nøgleGæt[3] != nøgle32[3]) {
   if (nøgleGæt[1] == 255) {
   nøgleGæt[0] += 1;
   nøgleGæt[1] = 0;
   } else if (nøgleGæt[2] == 255) {
   println(nøgleGæt);
   nøgleGæt[1] += 1;
   nøgleGæt[2] = 0;
   } else if (nøgleGæt[3] == 255) {
   
   nøgleGæt[2] += 1;
   nøgleGæt[3] = 0;
   } else {
   nøgleGæt[3] += 1;
   }
   decrypt(encryptionOutput, nøgleGæt);
   }
   println(decryptOutput);
   println(millis());
   */

  if (antalRunder == 6) {
    encryptionOutput = encrypt(state, nøgle8);
    decryptOutput = decrypt(encryptionOutput, nøgle8);
  } else if (antalRunder == 7) {
    encryptionOutput = encrypt(state, nøgle32);
    decryptOutput = decrypt(encryptionOutput, nøgle32);
  } else if (antalRunder == 8) {
    encryptionOutput = encrypt(state, nøgle64);
    decryptOutput = decrypt(encryptionOutput, nøgle64);
  } else if (antalRunder == 9) {
    encryptionOutput = encrypt(state, nøgle96);
    decryptOutput = decrypt(encryptionOutput, nøgle96);
  } else if (antalRunder == 10) {
    encryptionOutput =  encrypt(state, nøgle128);
    decryptOutput = decrypt(encryptionOutput, nøgle128);
  } else if (antalRunder == 11) {
    encryptionOutput =  encrypt(state, nøgle160);
    decryptOutput = decrypt(encryptionOutput, nøgle160);
  } else if (antalRunder == 12) {
    encryptionOutput =  encrypt(state, nøgle192);
    decryptOutput = decrypt(encryptionOutput, nøgle192);
  } else if (antalRunder == 13) {
    encryptionOutput =  encrypt(state, nøgle224);
    decryptOutput = decrypt(encryptionOutput, nøgle224);
  } else if (antalRunder == 14) {
    encryptionOutput =  encrypt(state, nøgle256);
    decryptOutput = decrypt(encryptionOutput, nøgle256);
  }


  println("encryption");
  for (int i = 0; i < 16; i++) {
    print(encryptionOutput[i] + " ");
  }
  println("");

  println("decrypt:");
  //decryptOutput = decrypt(encryptionOutput,nøgle128);
  for (int i = 0; i < 16; i++) {
    print((char)decryptOutput[i]);
  }
  println();




  /*
  int[] test2 = {96, 61, 235, 16, 21, 202 ,113 ,190 ,43, 115 ,174, 240 ,133 ,125 ,119 ,129, 31 ,53, 44, 7 ,59 ,97, 8, 215, 45, 152, 16 ,163, 9 ,20 ,223 ,244};
   
   int[] testOutput = calculateRoundKey256(test2);
   
   for (int i = 0; i < testOutput.length;i++){
   if (i % 4 == 0){
   println("");
   }
   print(hex(testOutput[i],2));
   
   }
   */




  /*
  // 54 68 61 74 73 20 6D 79 20 4B 75 6E 67 20 46 75
   int[] input = {84, 104, 97, 116, 115, 32, 109, 121, 32, 75, 117, 110, 103, 32, 70, 117};
   input = calculateRoundKey(input);
   for (int i = 0; i < 176; i++) {
   println(hex(input[i], 2));
   }
   */


  /*
  for(int i = 0; i < 256; i++){
   println(hex(inverseSubstituteBytes(i),2));
   }
   */
  // Sub bytes step.
  /*
  for(int i = 0; i < 256; i++){
   int output = substituteBytes(i);
   println(hex(output,2));
   }
   */
}

void draw() {
}
