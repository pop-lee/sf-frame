package cn.sftech.www.effect.viewStackEffect
{
	import cn.sftech.www.effect.SFMoveEffect;
	import cn.sftech.www.effect.base.SFEffect;
	import cn.sftech.www.effect.base.SFEffectBase;
	import cn.sftech.www.effect.base.SFEffectGroup;
	import cn.sftech.www.effect.base.SFViewStackEffect;
	import cn.sftech.www.event.SFHideEvent;
	import cn.sftech.www.event.SFShowEvent;
	import cn.sftech.www.view.SFContainer;
	
	import com.greensock.data.TweenLiteVars;
	
	import flash.display.DisplayObject;

	public class SFViewStackListEffect extends SFViewStackEffect
	{
		private var _baseIndex : uint;
		
		//表示变化的方向，用1表示正序和-1表示倒序
		private var _direction : int;
		
		private var _showEffect : SFMoveEffect = new SFMoveEffect();
		
		private var _hideEffect : SFMoveEffect = new SFMoveEffect();
		
		private var _effectArr : Vector.<SFEffectBase> = new Vector.<SFEffectBase>();
		
		public function SFViewStackListEffect()
		{
			super();
		}
		
		/**
		 * 描述效果播放特效的逻辑
		 * 
		 */		
		override protected function playEffect() : void
		{
			var child : DisplayObject;
			var minIndex : uint = Math.min(target.oldSelectIndex,target.selectedIndex);
			var maxIndex : uint = Math.max(target.oldSelectIndex,target.selectedIndex);
			
			var xFlag : Boolean = false;
			if(_effectArr.length == 0) {
				xFlag = true;
			} else {
				_effectArr.splice(0,_effectArr.length);
			}
			for(var i : int = 0;i < target.numChildren;i++) {
				child = target.getItemAt(i);
				if(xFlag) {
					child.x = (i - target.oldSelectIndex)*child.width;
				}
				
				child.visible = true;
				
				var moveEffect : SFMoveEffect = new SFMoveEffect();
				moveEffect.target = child;
				moveEffect.duration = duration/(maxIndex - minIndex);
				moveEffect.xTo = (i - target.selectedIndex)*child.width;
				if(i != target.selectedIndex) {
					moveEffect.vars.onComplete(effectOnComplete,[target.getItemAt(i),moveEffect]);
				}
				_effectArr.push(moveEffect);
				moveEffect.play();
			}
			
		}
		
		override protected function stopEffect():void
		{
			for(var i : int = 0;i < _effectArr.length;i++) {
				_effectArr[i].stop();
			}
		}
		
		private function effectOnComplete(object : DisplayObject,effect : SFEffect) : void
		{
			_effectArr.splice(_effectArr.indexOf(effect),1);
			object.visible = false;
		}
	}
}