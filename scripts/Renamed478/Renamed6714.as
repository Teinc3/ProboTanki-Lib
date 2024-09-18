package Renamed478
{
   import controls.FixedHeightRectangleSkin;
   import controls.buttons.H50ButtonSkin;
   
   public class Renamed6714 extends H50ButtonSkin
   {
      private static const leftUpClass:Class = Renamed9412;
      
      private static const middleUpClass:Class = Renamed9418;
      
      private static const rightUpClass:Class = Renamed9415;
      
      private static const leftOverClass:Class = Renamed9419;
      
      private static const middleOverClass:Class = Renamed9416;
      
      private static const rightOverClass:Class = Renamed9413;
      
      private static const leftDownClass:Class = Renamed9417;
      
      private static const middleDownClass:Class = Renamed9414;
      
      private static const rightDownClass:Class = Renamed9420;
      
      public static const Renamed6715:Renamed6714 = new Renamed6714();
      
      public function Renamed6714()
      {
         super(this.createStateSkin(leftUpClass,middleUpClass,rightUpClass),this.createStateSkin(leftOverClass,middleOverClass,rightOverClass),this.createStateSkin(leftDownClass,middleDownClass,rightDownClass));
      }
      
      private function createStateSkin(param1:Class, param2:Class, param3:Class) : FixedHeightRectangleSkin
      {
         return new FixedHeightRectangleSkin(param1,param2,param3);
      }
   }
}

