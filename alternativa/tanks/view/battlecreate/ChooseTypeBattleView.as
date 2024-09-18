package alternativa.tanks.view.battlecreate
{
   import alternativa.tanks.controllers.battlecreate.ICreateBattleFormViewCallBack;
   import controls.TypeBattleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class ChooseTypeBattleView extends Sprite
   {
      private const Renamed3897:int = 400;
      
      private var _battleTypesButton:Array;
      
      private var _selectedButton:TypeBattleButton;
      
      private var _callBack:ICreateBattleFormViewCallBack;
      
      private var _buttonLabelsName:Vector.<String>;
      
      private var Renamed3898:Vector.<String>;
      
      private var _componentWidth:Number = 0;
      
      private var _componentHeight:Number = 0;
      
      public function ChooseTypeBattleView(param1:Vector.<String>, param2:Vector.<String>, param3:ICreateBattleFormViewCallBack)
      {
         super();
         this._callBack = param3;
         this._buttonLabelsName = param1;
         this.Renamed3898 = param2;
         this.init();
      }
      
      protected function init() : void
      {
      }
      
      public function setAvailableTypesBattle(param1:Vector.<Renamed1587>) : void
      {
         var _loc2_:TypeBattleButton = null;
         var _loc3_:Object = null;
         this.destroy();
         this._battleTypesButton = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_ = new TypeBattleButton();
            _loc2_.data = param1[_loc4_];
            _loc2_.label = this._buttonLabelsName[param1[_loc4_].value];
            addChild(_loc2_);
            _loc3_ = new Object();
            _loc3_.id = param1[_loc4_].value;
            _loc3_.button = _loc2_;
            this._battleTypesButton[_loc4_] = _loc3_;
            _loc4_++;
         }
         this._battleTypesButton.sortOn(["id"],[Array.NUMERIC]);
         this.setEvents();
         this.resize(this._componentWidth,this._componentHeight);
      }
      
      public function setEvents() : void
      {
         var _loc1_:TypeBattleButton = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._battleTypesButton.length)
         {
            _loc1_ = this._battleTypesButton[_loc2_].button;
            _loc1_.addEventListener(MouseEvent.CLICK,this.onClickButton);
            _loc2_++;
         }
      }
      
      public function removeEvents() : void
      {
         var _loc1_:TypeBattleButton = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._battleTypesButton.length)
         {
            _loc1_ = this._battleTypesButton[_loc2_].button;
            _loc1_.removeEventListener(MouseEvent.CLICK,this.onClickButton);
            _loc2_++;
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:int = 0;
         if(this._battleTypesButton != null)
         {
            this.removeEvents();
            _loc1_ = 0;
            while(_loc1_ < this._battleTypesButton.length)
            {
               removeChild(this._battleTypesButton[_loc1_].button);
               this._battleTypesButton[_loc1_] = null;
               _loc1_++;
            }
         }
         this._battleTypesButton = null;
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:TypeBattleButton = null;
         var _loc7_:TypeBattleButton = null;
         this._componentWidth = param1;
         this._componentHeight = param2;
         if(this._battleTypesButton != null)
         {
            _loc3_ = int(this._battleTypesButton.length);
            _loc4_ = int((param1 - (_loc3_ - 1) * 4 + 1) / _loc3_);
            _loc5_ = 0;
            while(_loc5_ < this._battleTypesButton.length)
            {
               (_loc6_ = this._battleTypesButton[_loc5_].button).width = _loc4_;
               if(_loc5_ != 0)
               {
                  _loc7_ = this._battleTypesButton[_loc5_ - 1].button;
                  _loc6_.x = _loc7_.x + _loc7_.width + 4;
               }
               _loc5_++;
            }
            this.Renamed3899();
         }
      }
      
      private function Renamed3899() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = this._componentWidth > this.Renamed3897;
         var _loc3_:int = 0;
         while(_loc3_ < this._battleTypesButton.length)
         {
            _loc1_ = int(this._battleTypesButton[_loc3_].id);
            TypeBattleButton(this._battleTypesButton[_loc3_]["button"]).label = _loc2_ ? this._buttonLabelsName[_loc1_] : this.Renamed3898[_loc1_];
            _loc3_++;
         }
      }
      
      public function getComponentHeight() : Number
      {
         return this._battleTypesButton != null ? Number(this._battleTypesButton[0].button.height) : Number(10);
      }
      
      private function onClickButton(param1:MouseEvent) : void
      {
         var _loc2_:Renamed1587 = Renamed1587((param1.currentTarget as TypeBattleButton).data);
         this._callBack.onClickTypeBattleButton(_loc2_);
      }
      
      public function setTypeBattle(param1:Renamed1587) : void
      {
         var _loc2_:TypeBattleButton = null;
         if(this._selectedButton != null)
         {
            this._selectedButton.enabled = true;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this._battleTypesButton.length)
         {
            _loc2_ = this._battleTypesButton[_loc3_].button;
            if(param1 == Renamed1587(_loc2_.data))
            {
               this._selectedButton = _loc2_;
               this._selectedButton.enabled = false;
            }
            _loc3_++;
         }
      }
      
      public function getSelectedBattleMode() : Renamed1587
      {
         return Renamed1587(this._selectedButton.data);
      }
   }
}

