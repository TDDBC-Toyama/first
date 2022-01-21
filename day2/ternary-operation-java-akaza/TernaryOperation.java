class TernaryOperation
{
  /*
      complexOperation()内の三項演算子を使っている行を
      コメント有効化・無効化しながら試してください
  */

  static void complexOperation(String str, int num){
    /*
        bool1は、文法的にbool2/bool3のどちらの意味なのか
        それぞれ試したところ、実行結果は3つとも同じだった
    */
    boolean result = str != null && 0 < num ? true : false; // bool1
    // boolean result = ( str != null && 0 < num ) ? true : false; // bool2
    // boolean result = ( str != null ) && ( 0 < num ? true : false); // bool3

    /*
        試しにint型で書き直してみた
        実行結果はint1/int2で同じだが、int3はコンパイルエラー

        int1/int3は文法的に違う意味と分かったので
        上記のbool1/bool3も文法的には違う意味だと分かる
        ( str != null ) がboolean型を返すので
        代入先がboolean型の場合はエラーにならず動いていた
    */
    // int result = str != null &&  0 < num ? 1 : 2; // int1
    // int result = ( str != null &&  0 < num ) ? 1 : 2; // int2
    // int result = ( str != null ) && ( 0 < num ? 1 : 2); // int3

    /*
        後で気づいたけどこんなアプローチもある
        戻り値のtrue/falseを入れ替えてboolean型で試したところ
        bool6だけ実行結果が違うことが分かる
    */
    // boolean result = str != null && 0 < num ? false : true; // bool4
    // boolean result = ( str != null && 0 < num ) ? false : true; // bool5
    // boolean result = ( str != null ) && ( 0 < num ? false : true); // bool6

    System.out.println(str + ", " + num + " => " + result);
  }
  public static void main(String args[]){
    complexOperation(null, 1);
    complexOperation(null, 0);
    complexOperation("hogefuga", 1);
    complexOperation("hogefuga", 0);
  }
}
