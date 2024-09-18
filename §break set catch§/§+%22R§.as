package §break set catch§
{
   import §7"j§.§ q§;
   import §7"j§.§3!n§;
   import §7"j§.§8#n§;
   import §7"j§.§;!9§;
   import §7"j§.§extends super§;
   import §7"j§.§final var super§;
   import §7"j§.§implements for break§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§else package false§;
   import §extends for const§.§import use§;
   import §if set import§.§3"3§;
   import §switch var return§.§%]§;
   import §switch var return§.§null package throw§;
   
   public class §+"R§ extends §else package false§ implements §3"3§, § q§
   {
      private var §dynamic package set§:§import use§;
      
      private var range:Number;
      
      private var coneAngle:Number;
      
      private var sfxData:§null package throw§;
      
      private var §const set function§:§%]§;
      
      private var §7"o§:§;!9§;
      
      private var §catch package else§:§3!n§;
      
      private var §&#s§:§3!n§;
      
      public function §+"R§(param1:§import use§, param2:Number, param3:Number, param4:§null package throw§)
      {
         super();
         this.§dynamic package set§ = param1;
         this.range = param2;
         this.coneAngle = param3;
         this.sfxData = param4;
      }
      
      public function §else package while§(param1:Body, param2:Vector3, param3:Object3D) : void
      {
         if(this.§const set function§ == null)
         {
            this.§package var super§(param1,param2,param3);
            this.§`#y§(param3);
            this.§class set each§(param2,param3);
         }
      }
      
      public function §class set each§(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:§extends super§ = null;
         var _loc4_:§8#n§ = null;
         if(this.§catch package else§ == null)
         {
            this.§catch package else§ = §3!n§(this.§dynamic package set§.getObject(§3!n§));
            _loc3_ = §extends super§(this.§dynamic package set§.getObject(§extends super§));
            _loc3_.init(param2,param1);
            this.§catch package else§.init(_loc3_,this.sfxData.§function package use§,this.sfxData.§continue package false§);
            battleService.§3l§().§7"0§(this.§catch package else§);
         }
         if(this.§&#s§ == null)
         {
            this.§&#s§ = §3!n§(this.§dynamic package set§.getObject(§3!n§));
            _loc4_ = §8#n§(this.§dynamic package set§.getObject(§8#n§));
            _loc4_.init(param2,param1,§'x§().§const const true§(),§implements package get§.§super set set§);
            this.§&#s§.init(_loc4_,this.sfxData.§+#c§,this.sfxData.§break package implements§);
            battleService.§3l§().§7"0§(this.§&#s§);
         }
      }
      
      private function §package var super§(param1:Body, param2:Vector3, param3:Object3D) : void
      {
         this.§const set function§ = §%]§(this.§dynamic package set§.getObject(§%]§));
         this.§const set function§.init(param1,this.range,this.coneAngle,§implements package get§.§class catch dynamic§,param2,param3,this.sfxData,§'x§().§const const true§(),§implements package get§.§if catch static§,§implements package get§.§in static§,§implements package get§.§return set in§,§implements package get§.§?!-§,§implements package get§.§override default§,§implements package get§.§else set finally§);
         battleService.§3l§().§7"0§(this.§const set function§);
      }
      
      private function §`#y§(param1:Object3D) : void
      {
         var _loc2_:§implements for break§ = §implements for break§.create(this.sfxData.§catch var super§,§implements package get§.§final import§);
         this.§7"o§ = §;!9§(this.§dynamic package set§.getObject(§;!9§));
         this.§7"o§.§get set package§(_loc2_,param1,this);
         §'x§().§'M§().§each set set§(this.§7"o§);
      }
      
      public function §while set use§() : void
      {
         if(this.§const set function§ != null)
         {
            this.§const set function§.kill();
            this.§const set function§ = null;
            this.§4"Z§();
            this.§catch package else§.stop();
            this.§catch package else§ = null;
            this.§&#s§.stop();
            this.§&#s§ = null;
         }
      }
      
      private function §4"Z§() : void
      {
         if(this.§7"o§ != null)
         {
            this.§7"o§.kill();
            this.§7"o§ = null;
         }
      }
      
      public function §dynamic var each§(param1:§final var super§) : void
      {
         if(this.§7"o§ == param1)
         {
            this.§7"o§ = null;
         }
      }
   }
}

