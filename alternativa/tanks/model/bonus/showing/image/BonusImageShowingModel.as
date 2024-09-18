package alternativa.tanks.model.bonus.showing.image
{
   import alternativa.tanks.gui.CongratulationsWindowConfiscate;
   import alternativa.tanks.gui.CongratulationsWindowPresent;
   import alternativa.tanks.gui.IDestroyWindow;
   import alternativa.tanks.model.bonus.showing.info.BonusInfo;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import projects.tanks.client.panel.model.bonus.showing.image.BonusImageShowingModelBase;
   import projects.tanks.client.panel.model.bonus.showing.image.IBonusImageShowingModelBase;
   
   public class BonusImageShowingModel extends BonusImageShowingModelBase implements IBonusImageShowingModelBase, IObjectLoadListener
   {
      public function BonusImageShowingModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         var _loc1_:IDestroyWindow = null;
         var _loc2_:BonusInfo = BonusInfo(object.adapt(BonusInfo));
         if(_loc2_.getImage() == null)
         {
            _loc1_ = new CongratulationsWindowPresent(null,getInitParam().image,_loc2_.getTopText(),_loc2_.getBottomText(),object);
         }
         else
         {
            _loc1_ = new CongratulationsWindowConfiscate(object,getInitParam().image.data,_loc2_.getImage().data,_loc2_.getTopText(),_loc2_.getBottomText());
         }
         putData(IDestroyWindow,_loc1_);
      }
      
      public function objectUnloaded() : void
      {
         var _loc1_:IDestroyWindow = IDestroyWindow(getData(IDestroyWindow));
         _loc1_.destroy();
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

