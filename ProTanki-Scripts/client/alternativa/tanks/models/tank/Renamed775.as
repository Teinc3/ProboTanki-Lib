package alternativa.tanks.models.tank
{
   import Renamed1.Renamed909;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import alternativa.tanks.models.weapon.Renamed2984;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed775
   {
      public static var Renamed824:Renamed775;
      
      public static var Renamed2985:int = 10;
      
      public var battlefield:ClientObject;
      
      public var user:ClientObject;
      
      public var turret:ClientObject;
      
      public var hull:ClientObject;
      
      public var weapon:Renamed2984;
      
      public var local:Boolean;
      
      public var health:int;
      
      public var tank:Tank;
      
      public var Renamed2872:TankSpecification;
      
      public var userName:String;
      
      public var userRank:int;
      
      public var Renamed974:Renamed909;
      
      public var Renamed2986:int;
      
      public var spawnState:Renamed841;
      
      public var mass:Number = 1;
      
      public var turretObject:IGameObject;
      
      public function Renamed775()
      {
         super();
      }
   }
}

