package §with const extends§
{
   import alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf.§include include§;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class §#"5§ extends Sprite
   {
      public static const §const package while§:int = 1;
      
      public static const §null package final§:int = 2;
      
      public static const §!#f§:int = 3;
      
      public static const §^"N§:int = 4;
      
      public var §?#^§:Bitmap;
      
      public var §if catch dynamic§:Bitmap;
      
      public var §null catch extends§:Bitmap;
      
      private var states:Dictionary;
      
      private var currentState:§8!X§;
      
      public function §#"5§(param1:Bitmap, param2:Bitmap, param3:Bitmap, param4:§include include§)
      {
         this.states = new Dictionary();
         super();
         this.§?#^§ = param1;
         this.§if catch dynamic§ = param2;
         this.§null catch extends§ = param3;
         addChild(param1);
         addChild(param2);
         addChild(param3);
         this.states[§const package while§] = new §catch package const§(§const package while§,this);
         this.states[§^"N§] = new §3!K§(§^"N§,this,10 / 1000,1 / 1000,300);
         this.states[§null package final§] = new §;[§(§null package final§,this,param4,0);
         this.states[§!#f§] = new §;[§(§!#f§,this,param4,1);
         this.currentState = this.states[§const package while§];
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

