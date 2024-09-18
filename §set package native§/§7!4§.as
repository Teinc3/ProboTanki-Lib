package §set package native§
{
   import §"$§.§implements include§;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §7!4§ extends §return package if§
   {
      private var §,n§:§2!s§;
      
      private var §static set var§:§implements include§;
      
      public var modelId:int;
      
      public function §7!4§()
      {
         super();
         this.modelId = 39;
         this.§,n§ = §2!s§(modelRegistry.getModel(Long.getLong(500772743,-1275562344)));
         this.§static set var§ = §implements include§(modelRegistry.getModel(Long.getLong(1545673170,1705258317)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §else include§.§super var package§:
               this.§1!l§(param1);
               break;
            case §else include§.§switch set native§:
               this.§3#g§(param1);
               break;
            case §else include§.§,"u§:
               this.§get catch do§(param1);
               break;
            case §else include§.§finally catch set§:
               this.kill(param1);
               break;
            case §else include§.§0m§:
               this.§8"t§(param1);
               break;
            case §else include§.§else const for§:
               this.move(param1);
               break;
            case §else include§.§&D§:
               this.§each get§(param1);
               break;
            case §else include§.§&!]§:
               this.§;!2§(param1);
               break;
            case §else include§.§0!N§:
               this.§9!^§(param1);
               break;
            case §else include§.§throw catch var§:
               this.setHealth(param1);
               break;
            case §else include§.§5!4§:
               this.§[#o§(param1);
               break;
            case §else include§.§3!5§:
               this.§`!C§(param1);
               break;
            case §else include§.§switch continue§:
               this.spawn(param1);
               break;
            case §else include§.§native const static§:
               this.§in var null§(param1);
         }
      }
      
      private function §1!l§(param1:Object) : void
      {
         this.§,n§.§1!l§(§9#A§.§if for with§(param1.tankId));
      }
      
      private function kill(param1:Object) : void
      {
         this.§,n§.kill(§9#A§.§if for with§(param1.tankId),param1.killerTankId,param1.respawnDelay);
      }
      
      private function §8"t§(param1:Object) : void
      {
         this.§,n§.§8"t§(§9#A§.§if for with§(param1.tankId),param1.moveCommand,param1.turretDirection);
      }
      
      private function move(param1:Object) : void
      {
         this.§,n§.move(§9#A§.§if for with§(param1.tankId),param1.moveCommand);
      }
      
      private function §each get§(param1:Object) : void
      {
         this.§,n§.§each get§(§9#A§.§if for with§(param1.tankId),param1.control);
      }
      
      private function §;!2§(param1:Object) : void
      {
         this.§,n§.§;!2§(param1.position,param1.orientation);
      }
      
      private function §9!^§(param1:Object) : void
      {
         this.§,n§.§9!^§(§9#A§.§if for with§(param1.tankId),param1.rotateTurretCommand);
      }
      
      private function setHealth(param1:Object) : void
      {
         this.§,n§.setHealth(§9#A§.§if for with§(param1.tankId),param1.health);
      }
      
      private function spawn(param1:Object) : void
      {
         this.§,n§.spawn(§9#A§.§if for with§(param1.tankId),param1.team,param1.position,param1.orientation,param1.health,param1.incarnationId);
      }
      
      private function §`!C§(param1:Object) : void
      {
         this.§,n§.§`!C§(§9#A§.§if for with§(param1.tankId),param1.temperature);
      }
      
      private function §[#o§(param1:Object) : void
      {
         this.§,n§.§else package final§(§9#A§.§if for with§(param1.tankId),param1.maxSpeed,param1.maxTurnSpeed,param1.maxTurretRotationSpeed,param1.acceleration,param1.specificationId);
      }
      
      private function §in var null§(param1:Object) : void
      {
         this.§static set var§.objectUnloaded();
         this.§,n§.objectUnloaded(§9#A§.§if for with§(param1.tank));
      }
      
      private function §3#g§(param1:Object) : void
      {
         this.§,n§.§3#g§(§9#A§.§if for with§(param1.tankId),param1.effectId,param1.duration,param1.activeAfterDeath,param1.effectLevel);
      }
      
      private function §get catch do§(param1:Object) : void
      {
         this.§,n§.§get catch do§(§9#A§.§if for with§(param1.tankId),param1.effectId,false);
      }
   }
}

