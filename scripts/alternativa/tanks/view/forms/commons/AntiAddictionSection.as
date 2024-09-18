package alternativa.tanks.view.forms.commons
{
   import alternativa.tanks.view.events.AntiAddictionInfoUpdatedEvent;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import forms.events.LoginFormEvent;
   
   public class AntiAddictionSection extends TankWindowInner
   {
      public var realName:TankInputBase;
      
      public var idNumber:TankInputBase;
      
      private var _idValid:Boolean;
      
      private var _realNameValid:Boolean;
      
      public function AntiAddictionSection()
      {
         var _loc1_:LabelBase = null;
         super();
         this.width = 350;
         _loc1_ = new LabelBase();
         _loc1_.text = "按照版署《网络游戏未成年人防沉迷系统》要求 \n" + "\t未满18岁的用户和身份信息不完整的用户将受到防沉迷系统的限制，游戏沉迷时间超过3小时收益减半，超过5小时收益为0 。" + "\n\t已满18岁的用户将等待公安机关的身份验证，验证通过的用户将不受限制，不通过的用户需要重新修改身份信息，否则将纳入防沉迷系统管理。";
         _loc1_.x = 15;
         _loc1_.y = 15;
         _loc1_.wordWrap = true;
         _loc1_.width = width - 30;
         this.realName = new TankInputBase();
         this.realName.label = "您的真实姓名:";
         this.realName.x = 112;
         this.realName.y = _loc1_.y + _loc1_.height + 15;
         this.realName.width = width - this.realName.x - 15;
         this._realNameValid = false;
         this.idNumber = new TankInputBase();
         this.idNumber.label = "身份证号码:";
         this.idNumber.x = 112;
         this.idNumber.y = this.realName.y + this.realName.height + 10;
         this.idNumber.width = width - this.idNumber.x - 15;
         this._idValid = false;
         this.height = this.idNumber.y + this.idNumber.height + 15;
         addChild(_loc1_);
         addChild(this.realName);
         addChild(this.idNumber);
         this.idNumber.addEventListener(LoginFormEvent.TEXT_CHANGED,this.validateAddictionID);
         this.realName.addEventListener(LoginFormEvent.TEXT_CHANGED,this.validateRealName);
      }
      
      private function validateRealName(param1:LoginFormEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         if(this.realName != null)
         {
         }
         dispatchEvent(new AntiAddictionInfoUpdatedEvent());
      }
      
      private function validateAddictionID(param1:LoginFormEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         if(this.idNumber != null)
         {
         }
         dispatchEvent(new AntiAddictionInfoUpdatedEvent());
      }
      
      private function trimString(param1:String) : String
      {
         if(param1.charAt(0) == " ")
         {
            param1 = this.trimString(param1.substring(1));
         }
         if(param1.charAt(param1.length - 1) == " ")
         {
            param1 = this.trimString(param1.substring(0,param1.length - 1));
         }
         return param1;
      }
      
      public function isIdValid() : Boolean
      {
         return this._idValid;
      }
      
      public function isRealNameValid() : Boolean
      {
         return this._realNameValid;
      }
   }
}

