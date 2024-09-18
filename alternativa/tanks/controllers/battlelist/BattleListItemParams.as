package alternativa.tanks.controllers.battlelist
{
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.item.Renamed1620;
   import projects.tanks.client.battleservice.Renamed1586;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class BattleListItemParams
   {
      public var gamename:String;
      
      public var battleItemGO:IGameObject;
      
      public var battleMode:Renamed1587;
      
      public var id:String;
      
      public var dmatch:Boolean;
      
      public var reds:int;
      
      public var blues:int;
      
      public var friendsReds:int;
      
      public var friendsBlues:int;
      
      public var all:int;
      
      public var friends:int;
      
      public var maxPeople:int;
      
      public var nmap:String;
      
      public var rankRange:Renamed1586;
      
      public var accessible:Boolean;
      
      public var noSupplies:Boolean;
      
      public var suspicionLevel:Renamed1620;
      
      public var proBattle:Boolean;
      
      public var Renamed1624:Boolean;
      
      public var Renamed1625:String;
      
      public var additionalCrystalsPercent:int;
      
      public function BattleListItemParams()
      {
         super();
      }
   }
}

