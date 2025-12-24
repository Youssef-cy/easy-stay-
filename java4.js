class Student {
  constructor(name, grade) {
    this.name = name;
    this.grade = grade;
  }
}

class StudentManager {
  constructor() {
    this.students = [];
  }

  addStudent(name, grade) {
    const student = new Student(name, grade);
    this.students.push(student);
    this.displayStudents();
    this.updateAverage();
  }

  displayStudents() {
    const list = document.getElementById("studentList");
    list.innerHTML = "";

    this.students.forEach((student) => {
      const li = document.createElement("li");
      li.textContent = `${student.name}  ${student.grade}`;
      list.appendChild(li);
    });
  }

  updateAverage() {
    const total = this.students.reduce((sum, s) => sum + s.grade, 0);
    const avg = this.students.length
      ? (total / this.students.length).toFixed(2)
      : 0;

    document.getElementById("averageGrade").textContent = avg;
  }
}

const manager = new StudentManager();

function addStudent() {
  const name = document.getElementById("studentName").value;
  const grade = parseFloat(
    document.getElementById("studentGrade").value
  );

  if (name && !isNaN(grade)) {
    manager.addStudent(name, grade);
    document.getElementById("studentName").value = "";
    document.getElementById("studentGrade").value = "";
  } else {
    alert("Please enter a valid name and grade.");
  }
}