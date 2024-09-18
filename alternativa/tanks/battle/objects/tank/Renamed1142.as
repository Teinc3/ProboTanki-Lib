package alternativa.tanks.battle.objects.tank
{
   import Renamed136.Renamed663;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed917;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed922;
   
   public interface Renamed925
   {
      function Renamed1054(param1:Renamed664, param2:int = 0) : void;
      
      function Renamed1059(param1:Renamed922, param2:int = 0) : void;
      
      function Renamed696() : Body;
      
      function Renamed1071(param1:int = 0) : Vector3;
      
      function Renamed1072() : Vector3;
      
      function Renamed1074(param1:int = 0) : Number;
      
      function Renamed1020() : Object3D;
      
      function stopMovement() : void;
      
      function Renamed1078(param1:Boolean) : void;
      
      function Renamed1102(param1:Vector3, param2:int = 0) : void;
      
      function Renamed1103() : int;
      
      function Renamed1079(param1:Boolean) : void;
      
      function Renamed1075() : Renamed917;
      
      function Renamed1076() : void;
      
      function Renamed1032(param1:int = 7) : void;
      
      function get teamType() : Renamed663;
   }
}

