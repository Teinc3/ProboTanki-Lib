package com.alternativaplatform.projects.tanks.client.commons.types
{
   import Renamed602.3DPositionVector;
   
   public class TankState
   {
      public var health:int;
      
      public var position:3DPositionVector;
      
      public var orientation:3DPositionVector;
      
      public var turretAngle:int;
      
      public var control:int;
      
      public var turretControl:int;
      
      public function TankState()
      {
         super();
      }
   }
}

