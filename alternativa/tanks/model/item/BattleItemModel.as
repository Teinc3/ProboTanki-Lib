package alternativa.tanks.model.item
{
   import alternativa.tanks.service.battle.IBattleUserInfoService;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import projects.tanks.client.battleselect.model.item.§5!9§;
   import projects.tanks.client.battleselect.model.item.BattleItemCC;
   import projects.tanks.client.battleselect.model.item.BattleItemModelBase;
   import projects.tanks.client.battleselect.model.item.IBattleItemModelBase;
   
   public class BattleItemModel extends BattleItemModelBase implements IBattleItemModelBase, IObjectLoadListener, IBattleItem
   {
      [Inject]
      public static var battleListFormService:IBattleListFormService;
      
      [Inject]
      public static var battleUserInfoService:IBattleUserInfoService;
      
      public function BattleItemModel()
      {
         super();
      }
      
      public function madePrivate() : void
      {
         battleListFormService.madePrivate(object.name,getInitParam().name);
      }
      
      public function updateName(param1:String) : void
      {
         battleListFormService.updateName(object.name,param1);
      }
      
      public function updateSuspicious(param1:§5!9§) : void
      {
         battleListFormService.updateSuspicious(object.name,param1);
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         battleListFormService.battleItemRecord(object);
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
         battleUserInfoService.§try null§(object);
         battleListFormService.§implements var catch§(object.name);
      }
      
      public function getConstructor() : BattleItemCC
      {
         return getInitParam();
      }
   }
}

