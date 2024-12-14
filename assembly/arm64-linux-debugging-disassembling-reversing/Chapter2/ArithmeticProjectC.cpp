int a, b;
int main(int argc, char* argv[])
{
      a = 1;              // adr  x0, a
                          // mov  w1, #1
                          // str  w1, [x0]

      b = 1;              // adr  x0, b
                          // mov  w1, #1
                          // str  w1, [x0]


      b = b + a;          // adr  x0, b
                          // ldr  w1, [x0]
                          // adr  x0, a
                          // ldr  w0, [x0]
                          // add  w1, w1, w0
                          // adr  x0, b
                          // str  w1, [x0]


      ++a;                // adr  x0, a
                          // ldr  w1, [x0]
                          // add  w1, w1, #1
                          // str  w1, [x0]


      b = b * a;          // adr  x0, b
                          // ldr  w1, [x0]
                          // adr  x0, a
                          // ldr  w0, [x0]
                          // mul  w1, w1, w0
                          // adr  x0, b
                          // str  w1, [x0]
                          // results: [a] = 2 and [b] = 4
      return 0;
}
