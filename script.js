const canvas=document.getElementById('canvas');
const ctx=canvas.getContext('2d');
const nSlider=document.getElementById('n');
const kSlider=document.getElementById('k');
const nOut=document.getElementById('nVal');
const kOut=document.getElementById('kVal');
const saveBtn=document.getElementById('save');

function fitHiDPI(){
  const dpr=window.devicePixelRatio||1;
  const rect=canvas.getBoundingClientRect();
  canvas.width=Math.round(rect.width*dpr);
  canvas.height=Math.round(rect.width*dpr);
  ctx.setTransform(dpr,0,0,dpr,0,0);
}
function draw(n,k){
  fitHiDPI();
  ctx.clearRect(0,0,canvas.width,canvas.height);
  const dpr=window.devicePixelRatio||1;
  const cx=canvas.width/dpr/2, cy=cx, pad=20, R=cx-pad;
  const pts=[];
  for(let i=0;i<n;i++){
    const a=2*Math.PI*i/n-Math.PI/2;
    pts.push([cx+R*Math.cos(a), cy+R*Math.sin(a)]);
  }
  ctx.beginPath(); ctx.arc(cx,cy,R,0,Math.PI*2); ctx.strokeStyle='#999'; ctx.lineWidth=1; ctx.stroke();
  ctx.lineWidth=0.7;
  for(let i=0;i<n;i++){
    const j=(i*k)%n;
    const [x1,y1]=pts[i],[x2,y2]=pts[j];
    ctx.beginPath(); ctx.moveTo(x1,y1); ctx.lineTo(x2,y2);
    ctx.strokeStyle=`hsl(${(i*360/n)|0} 70% 45%)`; ctx.stroke();
  }
}
function update(){
  const n=parseInt(nSlider.value,10);
  const k=parseInt(kSlider.value,10);
  nOut.textContent=n; kOut.textContent=k; draw(n,k);
}
function savePNG(){
  const name=`times-table-n${nSlider.value}-k${kSlider.value}.png`;
  const a=document.createElement('a');
  a.download=name;
  a.href=canvas.toDataURL('image/png');
  a.click();
}
addEventListener('resize',update);
nSlider.addEventListener('input',update);
kSlider.addEventListener('input',update);
saveBtn.addEventListener('click',savePNG);
addEventListener('keydown',(e)=>{if(e.key.toLowerCase()==='s')savePNG();});
update();
