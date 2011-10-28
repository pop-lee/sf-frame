package cn.sftech.www.effect
{
	import cn.sftech.www.effect.base.SFEffect;
	
	import com.greensock.TweenLite;
	import com.greensock.data.TweenLiteVars;
	
	public class SFMoveEffect extends SFEffect
	{
		private var _xTo : Number;
		
		private var _xFrom : Number;
		
		private var _yTo : Number;
		
		private var _yFrom : Number;
		
		public function SFMoveEffect()
		{
			super();
		}
		
		public function set xTo(value : Number) : void
		{
			_xTo = value;
		}
		
		public function set xFrom(value : Number) : void
		{
			_xFrom = value;
		}
		
		public function set yTo(value : Number) : void
		{
			_yTo = value;
		}
		
		public function set yFrom(value : Number) : void
		{
			_yFrom = value;
		}
		
		override public function play():void
		{
			var _vars : TweenLiteVars = new TweenLiteVars();
			if(!isNaN(_xFrom))
				target.x = _xFrom;
			if(!isNaN(_yFrom))
				target.y = _yFrom;
			if(!isNaN(_xTo))
				_vars.prop("x",_xTo);
			if(!isNaN(_yTo))
				_vars.prop("y",_yTo);
			vars = _vars;
			super.play();
		}
		
	}
}