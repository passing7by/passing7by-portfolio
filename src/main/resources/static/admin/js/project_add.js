/**
 * 동적으로 폼을 추가/삭제
 */

// 폼 추가

function createNewRow() {
      const newRow = document.createElement('div');
			
      const newFormGroup1 = document.createElement('div'); // 제목
      const newFormGroup2 = document.createElement('div'); // 내용
      newFormGroup1.className = 'form-group row title-fg-row';
      newFormGroup2.className = 'form-group row';

      newRow.appendChild(newFormGroup1);
      newRow.appendChild(newFormGroup2);

      const newLabel1 = document.createElement('label'); // 제목
      const newLabel2 = document.createElement('label'); // 내용
      newLabel1.className = 'col-lg-2 col-form-label title-label';
      newLabel2.className = 'col-lg-2 col-form-label content-label';
      // for
      // textContent

      newFormGroup1.appendChild(newLabel1);
      newFormGroup2.appendChild(newLabel2);

      const newLabelSpan1 = document.createElement('span'); // 제목
      const newLabelSpan2 = document.createElement('span'); // 내용
      newLabelSpan1.className = 'text-danger';
      newLabelSpan2.className = 'text-danger';
      newLabelSpan1.textContent = '*';
      newLabelSpan2.textContent = '*';

      newLabel1.appendChild(newLabelSpan1);
      newLabel2.appendChild(newLabelSpan2);

      const inputDiv1 = document.createElement('div'); // 제목
      const inputDiv2 = document.createElement('div'); // 내용
      inputDiv1.className = 'col-lg-7';
      inputDiv2.className = 'col-lg-7 content-input-div';

      newFormGroup1.appendChild(inputDiv1);
      newFormGroup2.appendChild(inputDiv2);

      // -------------------------------------------------------------------------
      // inputDiv에는 input, textarea를 미리 넣어 놓음
      // 나중에 뭘 사용할건지 택1 하고, 나머지 하나는 지우기

      const input1 = document.createElement('input'); // 제목
      const input2 = document.createElement('input'); // 내용(input)
      const textarea = document.createElement('textarea') // 내용(textarea)
      input1.className = 'form-control title-input';
      input2.className = 'form-control content-input';
      textarea.className = 'form-control content-textarea';
      // type
      // name

      inputDiv1.appendChild(input1);
      inputDiv2.appendChild(input2);
      inputDiv2.appendChild(textarea);
      // -------------------------------------------------------------------------

      const delDiv = document.createElement('div')
      delDiv.className = 'row m-0 justify-content-end';

      newRow.appendChild(delDiv);

      const del = document.createElement('button');
      del.className = 'btn btn-danger m-b-30 del';
      del.type = 'button';
      del.textContent = '삭제';

      delDiv.appendChild(del);

      const dr = document.createElement('br');

      newRow.appendChild(dr);

      return newRow;
}

const addBtns = document.querySelectorAll('.add-btn');
const projectNoteBox = document.querySelector('#project-note-box');
const sectionBox = document.querySelector('#section-box');
const fileBox = document.querySelector('#file-box');

let dels;

let projectNoteCnt = projectNoteBox.childElementCount;
let sectionCnt = sectionBox.childElementCount;
let fileCnt = fileBox.childElementCount;

console.log("projectNoteCnt", projectNoteCnt);
console.log("sectionCnt", sectionCnt);
console.log("fileCnt", fileCnt);

addBtns.forEach(a => {
  a.addEventListener('click', function () {
    if(a.id === 'add-project-note') {
			console.log('projectNoteCnt: ', projectNoteCnt);
			
			const newRow = createNewRow();
      newRow.className = 'project-note-row';

      const titleLabel = newRow.querySelector('.title-label');
      titleLabel.setAttribute('for', `projectNoteVOs[${projectNoteCnt}].title`);
      titleLabel.prepend('제목');

      const titleInput = newRow.querySelector('.title-input');
      titleInput.type = 'text';
      titleInput.setAttribute('name', `projectNoteVOs[${projectNoteCnt}].title`);

      const contentLabel = newRow.querySelector('.content-label');
      contentLabel.setAttribute('for', `projectNoteVOs[${projectNoteCnt}].url`);
      contentLabel.prepend('링크');

      const contentInput = newRow.querySelector('.content-input');
      contentInput.type = 'text';
      contentInput.setAttribute('name', `projectNoteVOs[${projectNoteCnt}].url`);
      newRow.querySelector('.content-textarea').remove();

      projectNoteBox.appendChild(newRow);

			console.log(`projectNote[${projectNoteCnt}] 추가함`);
      projectNoteCnt++;
      
    } else if (a.id === 'add-section') {
			console.log('sectionCnt: ', sectionCnt);

      const newRow = createNewRow();
      newRow.className = 'section-row';

      const titleLabel = newRow.querySelector('.title-label');
      titleLabel.setAttribute('for', `sectionVOs[${sectionCnt}].title`);
      titleLabel.prepend('제목');

      const titleInput = newRow.querySelector('.title-input');
      titleInput.type = 'text';
      titleInput.setAttribute('name', `sectionVOs[${sectionCnt}].title`);

      const contentLabel = newRow.querySelector('.content-label');
      contentLabel.setAttribute('for', `sectionVOs[${sectionCnt}].content`);
      contentLabel.prepend('내용');

      const contentInputDiv = newRow.querySelector('.content-input-div');
      contentInputDiv.classList.remove('col-lg-7');
      contentInputDiv.classList.add('col-lg-10');

      const contentInput = newRow.querySelector('.content-textarea');
      contentInput.setAttribute('name', `sectionVOs[${sectionCnt}].content`);
      contentInput.setAttribute('rows', '7');
      newRow.querySelector('.content-input').remove();

      sectionBox.appendChild(newRow);

			console.log(`section[${sectionCnt}] 추가함`);
      sectionCnt++;
      
    } else if (a.id === 'add-file') {
      console.log('f');
      console.log('fileCnt: ', fileCnt);

      const newRow = createNewRow();
      newRow.className = 'file-row';

      newRow.querySelector('.title-fg-row').remove();

      newRow.querySelector('.content-label').remove();

			const contentInputDiv = newRow.querySelector('.content-input-div');
			contentInputDiv.classList.remove('col-lg-7');
			contentInputDiv.classList.add('col-lg-6');
			
			const contentInput = newRow.querySelector('.content-input');
      contentInput.type = 'file';
      contentInput.setAttribute('name', `attaches`);

      newRow.querySelector('.content-textarea').remove();

      fileBox.appendChild(newRow);

			console.log(`file[${fileCnt}] 추가함`);
      fileCnt++;
    }
		
		// 폼 삭제
		
		// 항목이 추가될 때마다 각 항목에 있는 삭제 버튼들을 불러와서 삭제 버튼 목록을 갱신하고 각 삭제 버튼에 이벤트 달기
		dels = document.querySelectorAll('.del');
		console.log(dels);
		
		dels.forEach((d) => {
		  d.addEventListener('click', function () {
		    console.log('click');
		    d.parentElement.parentElement.remove();
		  });
		});
		
  });
});

