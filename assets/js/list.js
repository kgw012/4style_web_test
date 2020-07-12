//상품리스트 넣기 js

var list = document.getElementById('list');
var num = 10;
for(var i = 0; i < num; i++){
    list.innerHTML += `
        <div class="box alt statistics">
			<!--목록-->
				<div class="row gtr-uniform">
					<div class="col-4">
						<span class="image fit"><img src="test_image02.jpg" alt="" /></span>
						<p>상품설명</p>
					</div>
				    <div class="col-4">
			            <span class="image fit"><img src="test_image02.jpg" alt="" /></span>
						<p>상품설명</p>
					</div>
					<div class="col-4">
						<span class="image fit"><img src="test_image02.jpg" alt="" /></span>
						<p>상품설명</p>
					</div>
				</div>
        </div>
    `;
}