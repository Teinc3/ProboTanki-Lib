package §case include§
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import §set break§.§try var finally§;
   
   public class §for var native§ implements §4"3§, §""k§
   {
      private var effects:§finally set if§;
      
      private var currentTarget:Tank;
      
      public function §for var native§(param1:§finally set if§)
      {
         super();
         this.effects = param1;
      }
      
      public function init(param1:§1"o§) : void
      {
         this.effects.init(param1.§2"F§(),param1.§else catch true§());
      }
      
      public function destroy() : void
      {
         this.reset();
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
         this.reset();
      }
      
      public function enable() : void
      {
      }
      
      public function disable(param1:Boolean) : void
      {
         this.reset();
      }
      
      public function reset() : void
      {
         this.currentTarget = null;
         this.effects.§while set use§();
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function §override var try§(param1:§try var finally§, param2:Tank = null, param3:Vector3 = null) : void
      {
         this.effects.§0&§(param1,param2,param3);
         this.currentTarget = param2;
      }
      
      public function §implements package for§() : void
      {
         this.effects.§0&§(§try var finally§.IDLE);
         this.currentTarget = null;
      }
      
      public function stop() : void
      {
         this.effects.§while set use§();
         this.currentTarget = null;
      }
      
      public function §for const super§(param1:Tank) : void
      {
         if(param1 != null)
         {
            if(this.currentTarget == param1)
            {
               this.currentTarget = null;
               this.effects.§0&§(§try var finally§.IDLE);
            }
         }
      }
   }
}

