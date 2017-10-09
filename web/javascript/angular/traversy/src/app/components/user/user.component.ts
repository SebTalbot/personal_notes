import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {
  name: string;
  age: number;
  address: Address;
  hobbies: string[];
  isMale: boolean;
  hello; any;

  constructor() { }

  ngOnInit() {
    this.name = 'foobar';
    this.age = 20;
    this.address = {
      city: 'testing',
      state: 'TS',
      street: 'test'
    };
    this.hobbies = [
      'Write code',
      'Watch movies',
      'Listen to music'
    ];
    this.isMale = true;
    this.hello = 'anything';
    this.hello = 2340;
  }

  onClick() {
    this.hobbies.push('Clicking Buttons');
  }

  addHobby(hobby) {
    this.hobbies.push(hobby);
    return false;
  }

  deleteHobby(hobby) {
    for (let i = 0; i < this.hobbies.length; i++) {
      if (this.hobbies[i] === hobby) {
        this.hobbies.splice(i, 1);
      }
    }
  }

}

// Create your own structurs
interface Address {
  street: string;
  city: string;
  state: string;
}
