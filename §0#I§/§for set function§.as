package §0#I§
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.§else if§;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   
   use namespace alternativa3d;
   
   public class §for set function§ extends Mesh implements §else if§
   {
      public static const §use for in§:Number = 1000;
      
      private var battleService:BattleService;
      
      private var material:Material;
      
      private var §7!2§:Vector.<Face>;
      
      private var uvs:Vector.<Point>;
      
      private var §true var return§:Vector.<Vector3D>;
      
      public function §for set function§(param1:Material, param2:BattleService)
      {
         this.uvs = new Vector.<Point>();
         this.§true var return§ = new Vector.<Vector3D>();
         super();
         this.material = param1;
         this.battleService = param2;
         useShadowMap = false;
         useLight = false;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         this.createGeometry();
         param2.§3l§().§const var extends§(this);
      }
      
      private function createGeometry() : void
      {
         var _loc1_:Vertex = null;
         var _loc2_:Vertex = null;
         var _loc3_:Vertex = null;
         var _loc4_:Number = §use for in§ * 0.5;
         var _loc5_:Number = §use for in§ * 0.5;
         this.§true var return§[0] = new Vector3D(0,_loc5_,0);
         this.§true var return§[1] = new Vector3D(-_loc4_,0,0);
         this.§true var return§[2] = new Vector3D(0,-_loc5_,0);
         this.§true var return§[3] = new Vector3D(_loc4_,0,0);
         this.uvs[0] = new Point(0.5,-0.5);
         this.uvs[1] = new Point(-0.5,0.5);
         this.uvs[2] = new Point(0.5,1.5);
         this.uvs[3] = new Point(1.5,0.5);
         this.§7!2§ = new Vector.<Face>();
         _loc1_ = this.createVertex(-_loc4_,0,0,-0.5,0.5);
         _loc2_ = this.createVertex(0,0,0,0.5,0.5);
         _loc3_ = this.createVertex(0,_loc5_,0,0.5,-0.5);
         this.§7!2§[0] = this.createFace(_loc1_,_loc2_,_loc3_,this.material);
         _loc1_ = this.createVertex(0,-_loc5_,0,0.5,1.5);
         _loc2_ = this.createVertex(0,0,0,0.5,0.5);
         _loc3_ = this.createVertex(-_loc4_,0,0,-0.5,0.5);
         this.§7!2§[1] = this.createFace(_loc1_,_loc2_,_loc3_,this.material);
         _loc1_ = this.createVertex(_loc4_,0,0,1.5,0.5);
         _loc2_ = this.createVertex(0,0,0,0.5,0.5);
         _loc3_ = this.createVertex(0,-_loc5_,0,0.5,1.5);
         this.§7!2§[2] = this.createFace(_loc1_,_loc2_,_loc3_,this.material);
         _loc1_ = this.createVertex(0,_loc5_,0,0.5,-0.5);
         _loc2_ = this.createVertex(0,0,0,0.5,0.5);
         _loc3_ = this.createVertex(_loc4_,0,0,1.5,0.5);
         this.§7!2§[3] = this.createFace(_loc1_,_loc2_,_loc3_,this.material);
         _loc1_ = this.createVertex(0,0,0,0,0);
         _loc2_ = this.createVertex(0,0,0,0.5,0.5);
         _loc3_ = this.createVertex(0,0,0,0,0);
         this.§7!2§[4] = this.createFace(_loc1_,_loc2_,_loc3_,this.material);
      }
      
      private function createVertex(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Vertex
      {
         var _loc6_:Vertex;
         (_loc6_ = new Vertex()).x = param1;
         _loc6_.y = param2;
         _loc6_.z = param3;
         _loc6_.u = param4;
         _loc6_.v = param5;
         _loc6_.alternativa3d::next = alternativa3d::vertexList;
         alternativa3d::vertexList = _loc6_;
         return _loc6_;
      }
      
      private function createFace(param1:Vertex, param2:Vertex, param3:Vertex, param4:Material) : Face
      {
         var _loc5_:Face = null;
         (_loc5_ = new Face()).material = param4;
         _loc5_.alternativa3d::wrapper = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::vertex = param1;
         _loc5_.alternativa3d::wrapper.alternativa3d::next = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::vertex = param2;
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::vertex = param3;
         _loc5_.alternativa3d::normalX = 0;
         _loc5_.alternativa3d::normalY = 0;
         _loc5_.alternativa3d::normalZ = 1;
         _loc5_.alternativa3d::offset = 0;
         _loc5_.alternativa3d::next = alternativa3d::faceList;
         alternativa3d::faceList = _loc5_;
         return _loc5_;
      }
      
      public function §switch const dynamic§(param1:Camera3D) : void
      {
         rotationX = param1.rotationX - Math.PI;
         rotationY = 0;
         rotationZ = param1.rotationZ;
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.§switch const dynamic§(this.battleService.§3l§().§super package§());
      }
   }
}

