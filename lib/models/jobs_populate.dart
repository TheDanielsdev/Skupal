import 'package:skupal/helper/icon_helper.dart';
import 'package:skupal/models/jobs.dart';
import 'package:skupal/models/jobs_single_models.dart';

class JobsPopulate {
  static List<Jobs> JobsPopulateFnc() {
    return [
      Jobs(
        picture: 'nuru.png',
        name: 'Sarah Nuru',
        price: 'NGN120k',
        title: 'UI/UX Design of MyBoard web app',
        descrption:
            'We are looking for a designer who can help us design our\ninternal app called MyBoard. It is used to store links by...',
        // descriptionThree: 'This is the description for page three',
        days: '4 days',
        dot: IconHelper.Dot,
        files: '3 Files',
        bids: '10+ Bids',
        minPosted: '25 Mins',
        daysIcon: IconHelper.Time,
        fileIcon: IconHelper.File,
        bidIcons: IconHelper.Bids,
        jobSingles: [
          Jobs_Single(
              '', //picture
              '', //name
              'Build UX UI onboarding screens for an existing app', //title
              'We are looking for a designer to help us design our internal app called MyBoard. It is used to store links by category for each employee of the team. It is a one-page website developed in react, it should be displayed well on both pcs and phones. We have already implemented a working version, and now we would like to finalize the design of it so that we can We are looking for a designer to help us design our internal app called MyBoard. It is used to store links by category for each employee of the team. It is a one-page website developed in react, it should be displayed well on both pcs and phones. We have already implemented a working version, and now we would like to finalize the design.', //description
              'tag1', //tag1
              'tag2', //tag2
              'tag3', //tag3
              'tag4', //tag4
              'Project Budget', //price label

              "Duration", //duration label

              'Payment Schedule', //milestone label
              "Milestone", //milestone
              "", //files
              '15+', //bids
              '25 Mins', //minposted
              '4 Days', //days
              '',
              'Lagos', //location
              IconHelper.Dot,
              IconHelper.Time,
              IconHelper.File,
              IconHelper.Bids,
              []),
        ],

        // Description_Model(
        //     '',
        //     '',
        //     '',
        //     '',
        //     '',
        //     'files',
        //     ' bids',
        //     'minPosted',
        //     'days',
        //     IconHelper.Dot,
        //     IconHelper.Time,
        //     IconHelper.File,
        //     IconHelper.Bids, [])
      ),
      Jobs(
          picture: 'jane cooper.png',
          name: 'Esther Ade',
          price: 'NGN110k',
          title: 'Build UX UI onboarding screens for an...',
          descrption:
              'We are looking for a designer who can help us design our\ninternal app called MyBoard. It is used to store links by...',
          days: '4 days',
          dot: IconHelper.Dot,
          files: '3 Files',
          bids: '10+ Bids',
          minPosted: '25 Mins',
          daysIcon: IconHelper.Time,
          fileIcon: IconHelper.File,
          bidIcons: IconHelper.Bids,
          jobSingles: [
            Jobs_Single(
                'price label',
                '',
                'duration label',
                'days label',
                'milestone',
                'milestone label',
                'tag1'
                    'tag2',
                'tag3',
                'tag4',
                'picture',
                " name",
                'NGN120k',
                "Build UX UI onboarding screens for an existing app",
                "The Body ooooo",
                'files',
                'bids',
                'minPosted',
                'days',
                IconHelper.Dot,
                IconHelper.Time,
                IconHelper.File,
                IconHelper.Bids,
                []),
          ]),
      Jobs(
          picture: 'jane cooper.png',
          name: 'Jane Cooper',
          price: 'NGN150k',
          title: 'Build UX UI onboarding screens for an...',
          descrption:
              'We are looking for a designer who can help us design our\ninternal app called MyBoard. It is used to store links by...',
          days: '4 days',
          dot: IconHelper.Dot,
          files: '3 Files',
          bids: '10+ Bids',
          minPosted: '25 Mins',
          daysIcon: IconHelper.Time,
          fileIcon: IconHelper.File,
          bidIcons: IconHelper.Bids,
          jobSingles: [
            Jobs_Single(
                'price label',
                '',
                'duration label',
                'days label',
                'milestone',
                'milestone label',
                'tag1'
                    'tag2',
                'tag3',
                'tag4',
                'picture',
                " name",
                'NGN120k',
                "Build UX UI onboarding screens for an existing app",
                "The Body ooooo",
                'files',
                'bids',
                'minPosted',
                'days',
                IconHelper.Dot,
                IconHelper.Time,
                IconHelper.File,
                IconHelper.Bids,
                []),
          ]),
      Jobs(
        picture: 'jane cooper.png',
        name: 'Jane Cooper',
        price: 'NGN150k',
        title: 'Build UX UI onboarding screens for an...',
        descrption:
            'We are looking for a designer who can help us design our\ninternal app called MyBoard. It is used to store links by...',
        days: '4 days',
        dot: IconHelper.Dot,
        files: '3 Files',
        bids: '10+ Bids',
        minPosted: '25 Mins',
        daysIcon: IconHelper.Time,
        fileIcon: IconHelper.File,
        bidIcons: IconHelper.Bids,
      ),
    ];
  }
}
