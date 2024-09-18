package alternativa.tanks.utils
{
   import alternativa.tanks.utils.thirdparty.URI;
   
   public class LinksInterceptor
   {
      private var _linkRegexp:RegExp;
      
      private var _linkRegexpExtra:RegExp;
      
      private var _linkRegexpAddon:RegExp;
      
      private var _allowedDomains:Vector.<String>;
      
      public var htmlFlag:Boolean = false;
      
      public function LinksInterceptor(param1:Vector.<String>)
      {
         this._linkRegexp = /(https?:\/\/)?((([\w-\.]+)\.([a-z]{2,6}\.?))|(([а-я-\.]+)\.(рф\.?)))(\/[\w\.]*)*\/?([^\s\n]+)?/gi;
         this._linkRegexpExtra = new RegExp(this._linkRegexp);
         this._linkRegexpAddon = /[\[\]\{\}\|\*\(\)\@\$\^\'`~+№!]/gi;
         super();
         this._allowedDomains = param1;
      }
      
      public function checkLinks(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:URI = null;
         var _loc4_:String = null;
         this._linkRegexp.lastIndex = 0;
         var _loc5_:String = "";
         var _loc6_:Array = this._linkRegexp.exec(param1);
         var _loc7_:int = 0;
         this.htmlFlag = false;
         while(_loc6_ != null)
         {
            _loc5_ += param1.substr(_loc7_,_loc6_.index - _loc7_);
            _loc2_ = param1.substr(_loc6_.index,this._linkRegexp.lastIndex - _loc6_.index);
            _loc3_ = new URI(_loc2_.indexOf("http://") == -1 ? "http://" + _loc2_ : _loc2_);
            _loc4_ = _loc3_.authority;
            if(this._allowedDomains.indexOf(_loc4_) != -1 && !this.existsUrlInQuery(_loc3_))
            {
               _loc5_ += " <u><a href=\'event:" + _loc3_ + "\'>" + _loc2_ + "</a></u> ";
               this.htmlFlag = true;
            }
            else
            {
               _loc5_ += _loc2_;
            }
            _loc7_ = this._linkRegexp.lastIndex;
            _loc6_ = this._linkRegexp.exec(param1);
         }
         return _loc5_ + param1.substr(this._linkRegexp.lastIndex == 0 ? Number(_loc7_) : Number(this._linkRegexp.lastIndex));
      }
      
      private function existsUrlInQuery(param1:URI) : Boolean
      {
         this._linkRegexpExtra.lastIndex = 0;
         if(this._linkRegexpExtra.exec(param1.queryRaw) != null)
         {
            return true;
         }
         this._linkRegexpAddon.lastIndex = 0;
         if(this._linkRegexpAddon.exec(param1.path) != null)
         {
            return true;
         }
         this._linkRegexpAddon.lastIndex = 0;
         if(this._linkRegexpAddon.exec(param1.fragment) != null)
         {
            return true;
         }
         return false;
      }
   }
}

