package cn.sftech.www.effect.base
{
	import cn.sftech.www.view.SFViewStack;
	
	import com.greensock.data.TweenLiteVars;

	public class SFViewStackEffect
	{
		private var _viewStack : SFViewStack;
		
		protected var _duration : Number = 1;
		
		protected var _vars : TweenLiteVars;
		
		public function SFViewStackEffect()
		{
		}
		
		public function set target(viewStack : SFViewStack) : void
		{
			_viewStack = viewStack;
		}
		
		public function get target() : SFViewStack
		{
			return _viewStack;
		}
		
		public function set duration(duration : Number) : void
		{
			_duration = duration;
		}
		
		public function get showEffect() : SFEffect
		{
			throw new Error("this function must be override");
		}
		
		public function get hideEffect() : SFEffect
		{
			throw new Error("this function must be override");
		}
	}
}