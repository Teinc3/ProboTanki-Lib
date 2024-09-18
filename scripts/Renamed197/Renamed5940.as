package Renamed5934
{
   import alternativa.tanks.model.bonus.showing.image.BonusImageShowingModel;
   import alternativa.tanks.model.bonus.showing.info.BonusInfoModel;
   import alternativa.tanks.model.bonus.showing.items.BonusItemModel;
   import alternativa.tanks.model.bonus.showing.items.BonusItemsShowingModel;
   import alternativa.types.Long;
   import Renamed347.Renamed5566;
   import Renamed385.Renamed4886;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.panel.model.bonus.showing.image.BonusImageCC;
   import projects.tanks.client.panel.model.bonus.showing.info.BonusInfoCC;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemCC;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemsShowingCC;
   
   public class Renamed5940 extends Renamed4886
   {
      private var Renamed5941:BonusItemsShowingModel;
      
      private var Renamed5942:BonusInfoModel;
      
      private var Renamed5943:BonusItemModel;
      
      private var Renamed5944:BonusImageShowingModel;
      
      private var Renamed5945:IGameClass;
      
      public var modelId:int;
      
      public function Renamed5940()
      {
         super();
         this.modelId = 21;
         this.Renamed5941 = BonusItemsShowingModel(modelRegistry.getModel(Long.getLong(0,300050008)));
         this.Renamed5942 = BonusInfoModel(modelRegistry.getModel(Long.getLong(0,300050006)));
         this.Renamed5943 = BonusItemModel(modelRegistry.getModel(Long.getLong(0,300050007)));
         this.Renamed5944 = BonusImageShowingModel(modelRegistry.getModel(Long.getLong(0,300050005)));
         var _loc1_:Vector.<Long> = new Vector.<Long>();
         _loc1_.push(this.Renamed5942.id);
         _loc1_.push(this.Renamed5943.id);
         _loc1_.push(this.Renamed5941.id);
         _loc1_.push(this.Renamed5944.id);
         this.Renamed5945 = gameTypeRegistry.createClass(Long.getLong(0,502350235),_loc1_);
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed5935.Renamed5936:
               this.show(param1);
               break;
            case Renamed5935.Renamed5937:
               this.Renamed5946(param1);
         }
      }
      
      private function show(param1:Object) : void
      {
         var _loc5_:* = undefined;
         var _loc6_:IGameObject = null;
         var _loc2_:IGameObject = spaceRegistry.getSpace(Long.getLong(884380667,214)).createObject(Renamed5566.Renamed5611(),this.Renamed5945,"BonusModelObject");
         var _loc3_:Object = JSON.parse(param1.json);
         var _loc4_:Vector.<IGameObject> = new Vector.<IGameObject>();
         for each(_loc5_ in _loc3_.items)
         {
            _loc6_ = spaceRegistry.getSpace(Long.getLong(884380667,214)).createObject(Renamed5566.Renamed5611(),this.Renamed5945,"BonusItem");
            Model.object = _loc6_;
            this.Renamed5943.putInitParams(new BonusItemCC(_loc5_.count,ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc5_.preview)))));
            Model.popObject();
            _loc4_.push(_loc6_);
         }
         Model.object = _loc2_;
         this.Renamed5942.putInitParams(param1.bonusInfo);
         this.Renamed5941.putInitParams(new BonusItemsShowingCC(_loc4_));
         this.Renamed5941.objectLoaded();
         Model.popObject();
      }
      
      private function Renamed5946(param1:Object) : void
      {
         var _loc2_:IGameObject = spaceRegistry.getSpace(Long.getLong(884380667,214)).createObject(Renamed5566.Renamed5611(),this.Renamed5945,"BonusObject");
         Model.object = _loc2_;
         this.Renamed5944.putInitParams(new BonusImageCC(param1.image));
         this.Renamed5942.putInitParams(new BonusInfoCC(param1.bottomText,null,param1.topText));
         this.Renamed5944.objectLoadedPost();
         Model.popObject();
      }
   }
}

