package alternativa.tanks.models.tank
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.§4%§;
   import alternativa.tanks.battle.§else package false§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.MathUtils;
   
   public class §6"[§ extends §else package false§ implements §4%§
   {
      private static const §final package break§:EncryptedInt = new EncryptedIntImpl(2000);
      
      private static const §implements const final§:Number = Math.PI / 6;
      
      private var tank:Tank;
      
      private var §7V§:int;
      
      private var §in for in§:Number;
      
      public function §6"[§(param1:Tank)
      {
         super();
         this.tank = param1;
      }
      
      public function reset() : void
      {
         this.§7V§ = §'x§().§]"d§();
         this.§in for in§ = this.tank.§set const implements§();
      }
      
      public function §function const static§(param1:Number) : void
      {
         if(this.§4$§())
         {
            this.§3!f§(false);
         }
         else if(this.§default for§())
         {
            this.§3!f§(true);
         }
      }
      
      private function §4$§() : Boolean
      {
         return this.§extends set while§();
      }
      
      private function §default for§() : Boolean
      {
         return this.§catch catch with§();
      }
      
      private function §catch catch with§() : Boolean
      {
         var _loc1_:Number = Math.abs(MathUtils.clampAngle(this.tank.§set const implements§() - this.§in for in§));
         return _loc1_ > §implements const final§;
      }
      
      private function §extends set while§() : Boolean
      {
         return §'x§().§]"d§() - this.§7V§ > §final package break§.getInt();
      }
      
      private function §3!f§(param1:Boolean) : void
      {
         this.reset();
         §2!s§(OSGi.getInstance().getService(§finally var return§)).onTurretDirectionCorrection(param1);
      }
   }
}

