package cn.sftech.www.effect.base
{
	import cn.sftech.www.event.SFHideEvent;
	import cn.sftech.www.event.SFPropertyChangeEvent;
	import cn.sftech.www.event.SFShowEvent;
	import cn.sftech.www.view.SFViewStack;
	
	import com.greensock.data.TweenLiteVars;
	
	import flash.display.DisplayObject;
	
	import mx.binding.utils.ChangeWatcher;

	public class SFViewStackEffect
	{
		private var _viewStack : SFViewStack;
		
		protected var _duration : Number = 1;
		
		protected var _vars : TweenLiteVars;
		
		protected var _effectSwitch : Boolean = true;
		
		public function SFViewStackEffect()
		{
		}
		
		public function set target(viewStack : SFViewStack) : void
		{
			_viewStack = viewStack;
//			if(ChangeWatcher.canWatch(_viewStack,"numChildren")) { 
//				ChangeWatcher.watch(_viewStack,"numChildren",changeChild);
//			}
//			addEffectEvent();
			if(ChangeWatcher.canWatch(viewStack,"selectedIndex")) {
				ChangeWatcher.watch(_viewStack,"selectedIndex",changeSelectedIndex);
			}
		}
		
		public function get target() : SFViewStack
		{
			return _viewStack;
		}
		
		public function set duration(duration : Number) : void
		{
			_duration = duration;
		}
		
		public function get duration() : Number
		{
			return _duration;
		}
		
		public function get showEffect() : SFEffectBase
		{
			throw new Error("this function must be override");
		}
		
		public function get hideEffect() : SFEffectBase
		{
			throw new Error("this function must be override");
		}
		
//		protected function addEffectEvent() : void
//		{
//			for(var i : uint = 0;i < _viewStack.numChildren;i++) {
//				var child : DisplayObject = _viewStack.getItemAt(i);
//				if(!child.hasEventListener(SFShowEvent.SHOW_EVENT)) {
//					child.addEventListener(SFShowEvent.SHOW_EVENT,show);
//				}
//				if(!child.hasEventListener(SFHideEvent.HIDE_EVENT)) {
//					child.addEventListener(SFHideEvent.HIDE_EVENT,hide);
//				}
//			}
//		}
//		
//		protected function show(event : SFShowEvent) : void
//		{
//			throw new Error("this function must be override");
//		}
//		
//		protected function hide(event : SFHideEvent) : void
//		{
//			throw new Error("this function must be override");
//		}
//		
//		private function changeChild(event : SFPropertyChangeEvent) : void
//		{
//			addEffectEvent();
//		}
		
		protected function changeSelectedIndex(event : SFPropertyChangeEvent) : void
		{
			stopEffect();
			playEffect();
		}
		
		protected function playEffect() : void
		{
			throw new Error("this function must be override");
		}
		
		protected function stopEffect() : void
		{
			throw new Error("this function must be override");
		}
		
	}
}