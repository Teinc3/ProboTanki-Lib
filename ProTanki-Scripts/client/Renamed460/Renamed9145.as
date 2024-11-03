package Renamed460
{
   import alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf.Renamed2682;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class Renamed2657 extends Sprite
   {
      public static const Renamed2686:int = 1;
      
      public static const Renamed2691:int = 2;
      
      public static const Renamed2692:int = 3;
      
      public static const Renamed2688:int = 4;
      
      public var Renamed9139:Bitmap;
      
      public var Renamed9140:Bitmap;
      
      public var Renamed2695:Bitmap;
      
      private var states:Dictionary;
      
      private var currentState:Renamed9141;
      
      public function Renamed2657(param1:Bitmap, param2:Bitmap, param3:Bitmap, param4:Renamed2682)
      {
         this.states = new Dictionary();
         super();
         this.Renamed9139 = param1;
         this.Renamed9140 = param2;
         this.Renamed2695 = param3;
         addChild(param1);
         addChild(param2);
         addChild(param3);
         this.states[Renamed2686] = new Renamed9142(Renamed2686,this);
         this.states[Renamed2688] = new Renamed9143(Renamed2688,this,10 / 1000,1 / 1000,300);
         this.states[Renamed2691] = new Renamed9144(Renamed2691,this,param4,0);
         this.states[Renamed2692] = new Renamed9144(Renamed2692,this,param4,1);
         this.currentState = this.states[Renamed2686];
         this.currentState.start();
      }
      
      public function setState(param1:int) : void
      {
         if(this.currentState.getType() == param1)
         {
            return;
         }
         this.currentState.stop();
         this.currentState = this.states[param1];
         this.currentState.start();
      }
      
      public function update(param1:int, param2:int) : void
      {
         this.currentState.update(param1,param2);
      }
   }
}

