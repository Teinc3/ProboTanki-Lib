package com.alternativaplatform.projects.tanks.client.models.tank
{
   import Renamed136.Renamed663;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankState;
   
   public class ClientTank
   {
      public var self:Boolean;
      
      public var teamType:Renamed663;
      
      public var incarnationId:int;
      
      public var tankSpecification:TankSpecification;
      
      public var tankState:TankState;
      
      public var spawnState:Renamed841;
      
      public var health:int;
      
      public function ClientTank()
      {
         super();
      }
   }
}

