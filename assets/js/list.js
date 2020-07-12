//상품리스트 넣기 js

var list = document.getElementById('list');
var num = 10;
for(var i = 0; i < num; i++){
    list.innerHTML += `
        <div class="box alt">
			<!--목록-->
				<div class="row gtr-uniform">
					<div class="col-4">
                        <span class="image fit" style="margin-bottom: 0;"><img src="test_image02.jpg" alt="" /></span>
                        <div class="row gtr-uniform">
                            <div class="col-11">
                                <p id="info" style="text-align: left;">김길웅이 입은 반팔티<br/>34,900원</p>
                            </div>
                            <div class="col-1" style="padding-left: 0;">
                                <p id="info"><br/>♡</p>
                            </div>
                        </div>
					</div>
				    <div class="col-4">
			            <span class="image fit"><img src="test_image02.jpg" alt="" /></span>
						<p id="info" style="text-align: left;">김길웅이 입은 반팔티<br/>34,900원</p>
					</div>
					<div class="col-4">
						<span class="image fit"><img src="test_image02.jpg" alt="" /></span>
						<p id="info" style="text-align: left;">김길웅이 입은 반팔티<br/>34,900원</p>
					</div>
				</div>
        </div>
    `;
}
