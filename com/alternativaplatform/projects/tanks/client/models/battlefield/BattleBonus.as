package com.alternativaplatform.projects.tanks.client.models.battlefield
{
   import Renamed602.Renamed603;
   import alternativa.object.ClientObject;
   import alternativa.types.Long;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BattleBonus
   {
      public var id:String;
      
      public var objectId:String;
      
      public var position:Renamed603;
      
      public var timeFromAppearing:int;
      
      public var timeLife:int;
      
      public var bonusResourceId:Long;
      
      public var bonusObject:IGameObject;
      
      public var object:ClientObject;
      
      public function BattleBonus()
      {
         super();
      }
   }
}

